package com.kosa.pro.model.auth;

import lombok.Data;

@Data
public class KakaoProfile {
	public Long id;
	public String connected_at;
	public Properties properties;
	public KakaoAccount kakao_account;

	@Data
	public class Properties {
		public String nickname;
		public String profile_image;
	    public String thumbnail_image;
	       
	}

	@Data
	public class KakaoAccount {
	  public Boolean profile_needs_agreement;
      public Profile profile;
      public Boolean has_email;
      public Boolean email_needs_agreement;
      public Boolean is_email_valid;
      public Boolean is_email_verified;
      public String email;
      public boolean profile_nickname_needs_agreement;
      public boolean profile_image_needs_agreement;
//		      public boolean has_age_range;
//		      public boolean age_range_needs_agreement;
//		      public String age_range;
//		      public boolean has_gender;
//		      public boolean gender_needs_agreement;
//		      public String gender;

		@Data
		public class Profile {
			public String nickname;
		    public String profile_image_url;
		    public Boolean is_default_image;
		    public String thumbnail_image_url;
		}
	}
}
