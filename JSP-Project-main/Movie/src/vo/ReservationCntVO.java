package vo;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

/**
 * 예약행사 신청 인원 정보 클래스
 */
@Data
@Builder
public class ReservationCntVO {
    Long cno;
    Date resDate;
    int currentResCnt;
    Integer capacity;

    public boolean checkResCnt() {
        return currentResCnt<capacity;
    }
}