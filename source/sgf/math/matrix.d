module sgf.math.matrix;

private:

import std.math;
import sgf.math.vector;
import sgf.math.quaternion;

public:

// Column major
struct Matrix {
    Vector4 row1;
    Vector4 row2;
    Vector4 row3;
    Vector4 row4;

    this(Vector4 row1, Vector4 row2, Vector4 row3, Vector4 row4) {
        this.row1 = row1;
        this.row2 = row2;
        this.row3 = row3;
        this.row4 = row4;
    }

    this(int m11, int m12, int m13, int m14,
         int m21, int m22, int m23, int m24,
         int m31, int m32, int m33, int m34,
         int m41, int m42, int m43, int m44) {
        row1 = Vector4(m11, m12, m13, m14);
        row2 = Vector4(m21, m22, m23, m24);
        row3 = Vector4(m31, m32, m33, m34);
        row4 = Vector4(m41, m42, m43, m44);
    }

    
    Vector3 backward() {
        return Vector3(row1.z, row2.z, row3.z);
    }

    Vector3 down() {
        return Vector3(row1.y, row2.y, row3.y);
    }

    Vector3 forward() {
        return Vector3(row1.z, row2.z, row3.z);
    }

    Vector3 left() {
        return Vector3(row1.x, row2.x, row3.x);
    }

    Vector3 right() {
        return Vector3(row1.x, row2.x, row3.x);
    }

    Vector3 up() {
        return Vector3(row1.y, row2.y, row3.y);
    }

    static Matrix identity() {
        return Matrix(1, 0, 0, 0,
                      0, 1, 0, 0,
                      0, 0, 1, 0,
                      0, 0, 0, 1);
    }

    static Matrix add(Matrix a, Matrix b) {
        return Matrix(Vector4.add(a.row1, b.row1),
                      Vector4.add(a.row2, b.row2),
                      Vector4.add(a.row3, b.row3),
                      Vector4.add(a.row4, b.row4));
    }

    static Matrix subtract(Matrix a, Matrix b) {
        return Matrix(Vector4.subtract(a.row1, b.row1),
                      Vector4.subtract(a.row2, b.row2),
                      Vector4.subtract(a.row3, b.row3),
                      Vector4.subtract(a.row4, b.row4));
    }

    static Matrix create_look_at(Vector3 position, Vector3 target, Vector3 up) {
        Vector3 zaxis = Vector3.normalize(Vector3.subtract(target, position));
        Vector3 xaxis = Vector3.normalize(Vector3.cross(up, zaxis));
        Vector3 yaxis = Vector3.cross(zaxis, xaxis);

        return Matrix(Vector4(xaxis.x, yaxis.x, zaxis.x, 0),
                      Vector4(xaxis.y, yaxis.y, zaxis.y, 0),
                      Vector4(xaxis.z, yaxis.z, zaxis.z, 0),
                    Vector4(-Vector3.dot(xaxis, position), -Vector3.dot(yaxis, position), -Vector3.dot(zaxis, position), 1));
    }

    static Matrix create_from_axis_angle(Vector3 axis, float angle) {
        float x = axis.x;
        float y = axis.y;
        float z = axis.z;

        float sin = sin(angle);
        float cos = cos(angle);
        float xx = x * x;
        float yy = y * y;
        float zz = z * z;
        float xy = x * y;
        float xz = x * z;
        float yz = y * z;

        return Matrix(Vector4(xx + cos * (1 - xx), xy - cos * xy + sin * z, xz - cos * xz - sin * y, 0),
                      Vector4(xy - cos * xy - sin * z, yy + cos * (1 - yy), yz - cos * yz + sin * x, 0),
                      Vector4(xz - cos * xz + sin * y, yz - cos * yz - sin * x, zz + cos * (1 - zz), 0),
                      Vector4(0, 0, 0, 1));
    }

    static Matrix create_ortographic(float width, float height, float near_plane, float far_plane) {
        return Matrix(Vector4(2 / width, 0, 0, 0),
                      Vector4(0, 2 / height, 0, 0),
                      Vector4(0, 0, 1 / (far_plane - near_plane), 0),
                      Vector4(0, 0, -near_plane / (far_plane - near_plane), 1));
    }

    static Matrix create_perspective_field_of_view(float field_of_view, float aspect_ratio, float near_plane, float far_plane) {
        float yscale = 1 / tan(field_of_view / 2);
        float xscale = yscale / aspect_ratio;

        return Matrix(Vector4(xscale, 0, 0, 0),
                      Vector4(0, yscale, 0, 0),
                      Vector4(0, 0, far_plane / (far_plane - near_plane), 1),
                      Vector4(0, 0, -near_plane * far_plane / (far_plane - near_plane), 0));
    }

    static Matrix create_from_quaternion(Quaternion q) {
        float x2 = q.x + q.x;
        float y2 = q.y + q.y;
        float z2 = q.z + q.z;

        float xx2 = q.x * x2;
        float yy2 = q.y * y2;
        float zz2 = q.z * z2;

        float yz2 = q.y * z2;
        float wx2 = q.w * x2;
        float xy2 = q.x * y2;
        float wz2 = q.w * z2;
        float xz2 = q.x * z2;
        float wy2 = q.w * y2;

        return Matrix(Vector4(1 - yy2 - zz2, xy2 + wz2, xz2 - wy2, 0),
                      Vector4(xy2 - wz2, 1 - xx2 - zz2, yz2 + wx2, 0),
                      Vector4(xz2 + wy2, yz2 - wx2, 1 - xx2 - yy2, 0),
                      Vector4(0, 0, 0, 1));
    }


    static Matrix create_from_yaw_pitch_roll(float yaw, float pitch, float roll) {
        Quaternion q = Quaternion.create_from_yaw_pitch_roll(yaw, pitch, roll);
        return create_from_quaternion(q);
    }
}


