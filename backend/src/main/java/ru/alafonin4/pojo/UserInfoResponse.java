package ru.alafonin4.pojo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import ru.alafonin4.enums.UserRole;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserInfoResponse {
    String email;
    UserRole role;
}
