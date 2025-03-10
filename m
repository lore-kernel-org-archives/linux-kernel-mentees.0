Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0BF1CAA6E
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Mar 2025 07:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741591857; cv=none; b=Ta+lcvML6rq174gX4VPVtMr+tNlesZI+eZIcVBGMGIO69DY7Q+V0Ub1Ycec9DdBXYeFcE9s5jcyuG+Yotd8jVMNT5Dq7Y10LpR/HsZTegXer1M/f3Cfec70+e0/a16KgVqRhC8oQkwFrpj6dDKUYAfoQlWdc8iZdmYpmcnJ9VkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741591857; c=relaxed/simple;
	bh=84FRLwi3VEAwx0R6siAMlBRl+tmVlak6qHOsl3RR3Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CjFLb3qxAUxf/SkFohY2NgzUSXFS/P749/I32iZbJirFvO3UUcAtLR3Mvr9tH9C2PMW81gbPj7cVIfRMj7lnJFKB4GMjnXoKdhV6gzaz8g0sFifXHwj7srPpUGcod8Fu77utnQRJ381rpK9Df17KxEDtd1pG0BE+DjGnmEns7/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4x9BM2Z; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4x9BM2Z"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2239aa5da08so58832705ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Mar 2025 00:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741591854; x=1742196654; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dmUbl1SNPN33YKejJF44kES5GFJl90ttXQH6Y+6xWoY=;
        b=N4x9BM2ZkBrLur6Ddbl/+AGyQHq9zIJHlNdYvcKleira8J1AmhENvG9vcj6hJIb8lK
         kCYcnVshlG57CmLjQsc38aULHdrdSUf2mp1nKtEymT8kBg687hsDq/v8Clp8euKGyGGy
         aIw+1o3b6jCC/l/gXuwJf800UWSsi0aEcG/kHx1nKGbS77gsWHIxThuFDFCGD0yK02OL
         w1+4sfd7z9LeI/wZR2rIkkpH1TM4skp41TK78cuYu+S89pfOv7Bm6t9i8ZRCaWsVqcQb
         f5rvLa1bi6z8PIUKHEVRIFPW3wy/7DcmteqZ0Ho/1B5i2XT6Z1bIyITvDTrxVKL+wqxj
         orlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741591854; x=1742196654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmUbl1SNPN33YKejJF44kES5GFJl90ttXQH6Y+6xWoY=;
        b=V8crushmx7+raLaVT/Jv0VOSRILTXLo3uFgieOE/8dOFcRd4p329wXyUMX/jv2OUc9
         0JIlbX9fj/qawOe146Hiwc3SjHOFQKI/bJdO6ZZIo6YO2RfznckJ7QLQB11lWinKVunk
         SbaVYhn+90wpCpUeT0Laf8q+uQ0KnJdgj0GNbvGTu/aASOWtc2F/OptdM1o+dQ2KE5HM
         KQPw7SrLPSkl+qJriPHnHF4rukdshDwcL8Fqt5X0ZgW4aU/vWvWwwwxCsI5ptluBEnzU
         w3zCtDKDeJ0gB/37pArEyjsC2UfeoMJPjZNxYTYpsxBsx4FXa3GIWH97ed76FrhXBVYZ
         phOw==
X-Forwarded-Encrypted: i=1; AJvYcCWJeAW55DOqZ6cI9WM+edhP19dAWighvNYCDD7XDWxxZ0d2zgQuBL8zCpmW1GOKZx9ntVnppgYLW6fgXWxtjU8lWlEzUg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yye3SZRNM1p5WPPcUPiGLIkTbmQQDOHUr1n/hu7r3jBHaNr0Bos
	Q8CZy836+MIMmpCmU72bJoMWfJCMf+K8LIhDpBqQLGcExxHXDFIr
X-Gm-Gg: ASbGncu1taaV0F3i9dnIAUPA3/2pUOPA9C1ed8nBhnQHlQLVHNiyXxVhLHgTlK0qUB7
	lV9d0YFRGzSLkujA1zys5CqYa1geay2PFCqlu+UBYVNQPsIQ990VM4K6S5JgV/oVnNIRM5IzWFc
	LRGI6MB9RIJsw+/k33oPDvw3h5y3q/4GxvN0XJkKQAQiSZe5ibzdxIM0gYJoxROfUtrxo8jfeWl
	0ojy79NLQjVX4rwQTH8MmlYPwDl8oo7gnon6sazhupJ5QL7eZzwe0PHR9ySu20Csg+nbaCcvYHO
	3t4rXV85pKROjfBJrweJ5E1S8nUNn1fxPm0SnlbCHyoCPdbtTzPR7h1rgXaySKTZ9BwG39BFjw=
	=
X-Google-Smtp-Source: AGHT+IGaLXdVookzjXhdP3t9TWNQSkoPex+/Iu3eVAiYGn0yVxQx1WSTeEMykevSKZRXTuYM7jsRtA==
X-Received: by 2002:a17:902:f686:b0:224:1ec0:8a1d with SMTP id d9443c01a7336-22428ab535bmr179596005ad.30.1741591853594;
        Mon, 10 Mar 2025 00:30:53 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:7ad0:37c7:5275:4b0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f773sm70840715ad.117.2025.03.10.00.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 00:30:52 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: ojeda@kernel.org
Cc: alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	jserv@ccns.ncku.edu.tw,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH 0/2] rust: list: Add examples for linked list
Date: Mon, 10 Mar 2025 15:30:38 +0800
Message-ID: <20250310073040.423383-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduce runnable examples for linked list. They also
serve as the unit tests for the methods for "List".
A new initialized method is also introduced for "ListLinks", in order to
provide the ability to create a new "ListLinks" instance, and provide
simplicity for the examples.

If there exists a convenient and proper way to handle the return type
of "ListLinks::new()", e.g. "ListLinks::try_pin_init()" , then the
method won't be needed.

I Hsin Cheng (2):
  rust: list: Implement normal initializer for ListLinks
  rust: list: Add examples for linked list

 rust/kernel/list.rs | 100 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

-- 
2.43.0

