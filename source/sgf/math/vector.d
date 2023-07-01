module sgf.math.vector;

private:

import std.math;

public:

struct Vector2 {
    float x;
    float y;

    this(float a) {
        x = a;
        y = a;
    }

    this(float x, float y) {
        this.x = x;
        this.y = y;
    }

    static Vector2 zero() {
        return Vector2(0.0f, 0.0f);
    }

    static Vector2 one() {
        return Vector2(1.0f, 1.0f);
    }

    static Vector2 add(Vector2 a, Vector2 b) {
        return Vector2(a.x + b.x, a.y + b.y);
    }

    static void add(Vector2 a, Vector2 b, out Vector2 result) {
        result.x = a.x + b.x;
        result.y = a.y + b.y;
    }

    static Vector2 subtract(Vector2 a, Vector2 b) {
        return Vector2(a.x - b.x, a.y - b.y);
    }

    static Vector2 normalize(Vector2 a) {
        float length = sqrt(a.x * a.x + a.y * a.y);
        return Vector2(a.x / length, a.y / length);
    }

    static void normalize(Vector2 a, out Vector2 result) {
        float length = sqrt(a.x * a.x + a.y * a.y);
        result.x = a.x / length;
        result.y = a.y / length;
    }

    static Vector2 dot(Vector2 a, Vector2 b) {
        return Vector2(a.x * b.x + a.y * b.y);
    }

    static Vector2 lerp(Vector2 a, Vector2 b, float t) {
        return Vector2(a.x + (b.x - a.x) * t,
                       a.y + (b.y - a.y) * t);
    }

    static Vector2 lerp(Vector2 a, Vector2 b, Vector2 t) {
        return Vector2(a.x + (b.x - a.x) * t.x,
                       a.y + (b.y - a.y) * t.y);
    }
}

struct Vector3 {
    float x;
    float y;
    float z;

    this(float a) {
        x = a;
        y = a;
        z = a;
    }

    this(float x, float y, float z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    static Vector3 zero() {
        return Vector3(0.0f, 0.0f, 0.0f);
    }

    static Vector3 one() {
        return Vector3(1.0f, 1.0f, 1.0f);
    }

    static Vector3 add(Vector3 a, Vector3 b) {
        return Vector3(a.x + b.x, a.y + b.y, a.z + b.z);
    }

    static void add(Vector3 a, Vector3 b, out Vector3 result) {
        result.x = a.x + b.x;
        result.y = a.y + b.y;
        result.z = a.z + b.z;
    }

    static Vector3 subtract(Vector3 a, Vector3 b) {
        return Vector3(a.x - b.x, a.y - b.y, a.z - b.z);
    }

    static Vector3 normalize(Vector3 a) {
        float length = sqrt(a.x * a.x + a.y * a.y + a.z * a.z);
        return Vector3(a.x / length, a.y / length, a.z / length);
    }

    static void normalize(Vector3 a, out Vector3 result) {
        float length = sqrt(a.x * a.x + a.y * a.y + a.z * a.z);
        result.x = a.x / length;
        result.y = a.y / length;
        result.z = a.z / length;
    }

    static Vector3 cross(Vector3 a, Vector3 b) {
        return Vector3(a.y * b.z - a.z * b.y,
                       a.z * b.x - a.x * b.z,
                       a.x * b.y - a.y * b.x);
    }

    static float dot(Vector3 a, Vector3 b) {
        return a.x * b.x + a.y * b.y + a.z * b.z;
    }

    static Vector3 lerp(Vector3 a, Vector3 b, float t) {
        return Vector3(a.x + (b.x - a.x) * t,
                       a.y + (b.y - a.y) * t,
                       a.z + (b.z - a.z) * t);
    }
}

struct Vector4 {
    float x;
    float y;
    float z;
    float w;

    this(float a) {
        x = a;
        y = a;
        z = a;
        w = a;
    }

    this(float x, float y, float z, float w) {
        this.x = x;
        this.y = y;
        this.z = z;
        this.w = w;
    }

    static Vector4 zero() {
        return Vector4(0.0f, 0.0f, 0.0f, 0.0f);
    }

    static Vector4 one() {
        return Vector4(1.0f, 1.0f, 1.0f, 1.0f);
    }

    static Vector4 add(Vector4 a, Vector4 b) {
        return Vector4(a.x + b.x, a.y + b.y, a.z + b.z, a.w + b.w);
    }

    static void add(Vector4 a, Vector4 b, out Vector4 result) {
        result.x = a.x + b.x;
        result.y = a.y + b.y;
        result.z = a.z + b.z;
        result.w = a.w + b.w;
    }

    static Vector4 subtract(Vector4 a, Vector4 b) {
        return Vector4(a.x - b.x, a.y - b.y, a.z - b.z, a.w - b.w);
    }

    static Vector4 normalize(Vector4 a) {
        float length = sqrt(a.x * a.x + a.y * a.y + a.z * a.z + a.w * a.w);
        return Vector4(a.x / length, a.y / length, a.z / length, a.w / length);
    }

    static void normalize(Vector4 a, out Vector4 result) {
        float length = sqrt(a.x * a.x + a.y * a.y + a.z * a.z + a.w * a.w);
        result.x = a.x / length;
        result.y = a.y / length;
        result.z = a.z / length;
        result.w = a.w / length;
    }

    static Vector4 dot(Vector4 a, Vector4 b) {
        return Vector4(a.x * b.x + a.y * b.y + a.z * b.z + a.w * b.w);
    }

    static Vector4 cross(Vector4 a, Vector4 b) {
        return Vector4(a.y * b.z - a.z * b.y,
                       a.z * b.x - a.x * b.z,
                       a.x * b.y - a.y * b.x,
                       0.0f);
    }

    static Vector4 lerp(Vector4 a, Vector4 b, float t) {
        return Vector4(a.x + (b.x - a.x) * t,
                       a.y + (b.y - a.y) * t,
                       a.z + (b.z - a.z) * t,
                       a.w + (b.w - a.w) * t);
    }
}