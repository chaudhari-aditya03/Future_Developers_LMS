package org.example.future_developers_lms.model;

public class User {
    private int userId;
    private String fullName;
    private String email;
    private String password;
    private String role;
    private String gender;
    private int age;
    private String phone;
    private String address;
    private String profilePhoto;

    public User()
    {
        super();
    }
    public User(int userId,String fullName,String email,String password,String role,String gender,int age,String phone,String address,String profilePhoto)
    {
        this.userId = userId;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.role = role;
        this.gender = gender;
        this.age = age;
        this.phone = phone;
        this.address = address;
        this.profilePhoto = profilePhoto;
    }
    // Getters and Setters
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getProfilePhoto() { return profilePhoto; }
    public void setProfilePhoto(String profilePhoto) { this.profilePhoto = profilePhoto; }
}
