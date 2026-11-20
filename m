Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182100;
	b=APLkZWKtsHHGv+Cx8OIFn7Zk5pmhOhrGhA2gv2FtpA56g9qOCSZzA99/yS+jU469MxC3
	 91p8TQHdUfSdNoDwTOinfIJtk4kONisf9LazIJXXQcdo6yIqKtULM0LoUHNhTQ/ejsgL5
	 tEZSGqLR2lC9uxXweqWSVGDRo2A5QDplVxeQDbPGZ0NbPkGuC7/Kr4nEZO02myahZxu3a
	 BuD1O4G8W4t89abEj4dKgAUBdDyBPJV9U+lbZpSX6iPeqUQ8Y08qMXV22hrEB0aFXZc4z
	 22d+ggBe0hoIVmoedXIrigIHHFxHcX7iPqew/mbAqHpAgot2guyEKZGFqHwGH5zEYRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1WRSk1fMXYd5O0O6jt0KQHSp9k/CAUXLKK0HBCgDuMc=;
	b=2URbWIkhvCwcKP301/SLJqmaPnEDHLnpU/EhgPgfDT6c/3YYgKvFwsBiiHmRDXVso7Qt
	 E7hna1HFaX069WZybz3YM9FakOD1HQQ8IMbQ3kQhjYD829nwBam6a6XBDv/oFnWoiS52l
	 qs4dfQWFM2yny/07mwN7jv5xkLm1CaNn1pMN0IEgGcWwBZMOH7dBM3LHtDfZXIjSm0PYJ
	 szef1bgrr8qa9HP02wV8mQyGihKotXbafmXWxCFuqZG9vLKMAYCTv2DN0qaLIOItVgJ6G
	 wNwaOb5DLE3ARzEkYOU7p33qXKfklNgVy9CixeOebMP7ahK1Ex6F4x95VfGQWMUcRNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QLSxUsjT;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E2E60A260D
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 20 Nov 2026 13:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53E2E60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QLSxUsjT
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b467581b98so8765365e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 20 Nov 2026 05:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182099; x=1795786899; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1WRSk1fMXYd5O0O6jt0KQHSp9k/CAUXLKK0HBCgDuMc=;
        b=QLSxUsjTk53TmYIc31scHCXrPOLR+v/i8WUsx6kjIEkNxxqZ8Hm1kwyGSKX/8wxxD2
         iDSyp9D60xuRm+bdv8TAYRTvKpWLcK2TQL3hMesqmYP33CCGRD8jMebsht03ZgqlhIh+
         iU2CLdqG+4fXUmNElgBGgCttBpvMCmcr4QZli5Bh6OlgJbcLtfnmCEJl6YVbMabPQfMU
         I2zNtbClK1JUEE7YZzkYYR40WAfu42TBRRId3y00AU8oqVfJHatdoTy16YvmA4jNoFxy
         jhNwUxyLIZPje6kdUE63avqy1U/IbSsbpDGY0YM33XsWxhv0Ks60LABdBWCLtU8Rf5Zx
         BMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182099; x=1795786899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1WRSk1fMXYd5O0O6jt0KQHSp9k/CAUXLKK0HBCgDuMc=;
        b=zLiy0K0C/UGNyC4qdk2b5FnoE/3ojTp+1Ei2JS+JBG7SYTJVFRYUh4m7CiCPFiiwgx
         hIaSXIxfJ38AY4qJONIUXOhlj9bhGIC55XsBFsPOS1/9BwejueGRgwoW1XObWr0JVS/C
         xTiM+aN5w78S78EfB1KudA2I6M+qhSGFCiz1Urcf0PZHTGDLwRlqOKj/9BH/uP5nPBBy
         M5P09KMkhfbpAa8xGYVtsz3d8aWtCkIPBK3cNgGlO29RyygczLqM30O7T4VCeFeWqblK
         9CPbFXCilw/GTcqa9GmHbv3T8GHPsdCRNtMhKSS86FdnBu8w0wFJwRGZm0aNrc8qGAy6
         ghjw==
X-Gm-Message-State: APuU4Z9GYqdR0QzrqM9Omrx3mAGKnKdYZuOEvIsQoJQkdDA5QA//mkAw
	/eq3Qu+s9puxR2n+5sMwtn+yHEb5Ecvkmm6plkmNjoiyKaiqxCVO1c8=
X-Gm-Gg: AYBFou1vJIFEGAGi9uGMMOh0z8Gi+zFmW7jwgtZ2HmNlnKnJCpm0RtoTWlpHAiAdEzS
	muJ4aGMICEex+0ahh9d7g3boXJTSvFFPTEU7caw+18Rm9hAhf8t1nGCynkcafBTpQL/7Skkk7Y9
	k7CWFhnirT254YocZHHJkY9dxdRKpNIoQg68sYliTkKGL6jE81QMou9lVwFq6FncfnExVEACYHE
	qBOIcNOfCbX1gJFy1pLN/jeQ6xz2bwpQkbVrs0CgwOqJou1lHTFoG9agO4wIiRtuDlLbwYbLA0R
	H324tmGNkQeapL3InOb9o5YorZ6VfevKbbDgr4oLxlzcW/TceT2+zYSJwSFLn96IxXfiqH3a/xM
	YOueNgcTLGW/XGbmUOyZZ3r/BKf5l1dg/I8YCZ8fPYOga1s1DH0X8A0Fq7SSSinUk7PrNyqrRoU
	6b8w3YBhM6Xsds3d7LWkGyyXQ7qC/xXKCt1Mu8K7ckvnbtYM76yP1SUzK/rQog5LxcLV6lNPKun
	f6Ueiv7RTCHzHsWX7hSL/H9Pvv3nPa9UKisbEnibg3TSew/FoEPiGXhufhgoKNSiPlNczAVu3tm
	If6oJ1zyJFfZEytiBPrXn3GJlRWcBruD2OMQDJiwxIIqf4Fh05Fa+pUt42ninRp0W0k89uPFDWQ
	nsAuHpT4y/7ocViWonJN7KRF+0oB5IC/eJ3JO6rIZeP2vspHWvZub2V3Zkdf+Ix4LfMYVFXxJEK
	XdQnv/mu77ZY4sxDZrLWVQ8CGj1Kg73zs9+cnECSfvb0JwBqGjHEPnss341oqiVxm+5kCt/dPyw
	e8N
X-Received: by 2002:a05:600c:3b8a:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb8892da25mr69150435e9.22.1795182098659;
        Fri, 20 Nov 2026 05:41:38 -0800 (PST)
Received: from archtop.localdomain (92-242-248-67.broadband.mtnet.hr. [92.242.248.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm186430835e9.4.2026.11.20.05.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:41:38 -0800 (PST)
From: Jakov Novak <jakovnovak30@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jakov Novak <jakovnovak30@gmail.com>
Subject: [PATCH] selftests/x86: sigframe_fpu_portability: fix TAP plan mismatches
Date: Fri, 20 Nov 2026 14:40:06 +0100
Message-ID: <20261120134006.4819-1-jakovnovak30@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Post: <mailto:linux-kernel-mentees@lists.linux.dev>
List-Help: <mailto:linux-kernel-mentees+help@lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-kernel-mentees+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 The plan set to 2 with ksft_set_plan(), but check_avx_support()
 may call ksft_exit_skip() which leads to a TAP plan mismatch.
 Move the ksft_set_plan() call after the check is done.

Signed-off-by: Jakov Novak <jakovnovak30@gmail.com>
---
 tools/testing/selftests/x86/sigframe_fpu_portability.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/x86/sigframe_fpu_portability.c b/tools/testing/selftests/x86/sigframe_fpu_portability.c
index 8377de052032..f738895e5159 100644
--- a/tools/testing/selftests/x86/sigframe_fpu_portability.c
+++ b/tools/testing/selftests/x86/sigframe_fpu_portability.c
@@ -221,12 +221,13 @@ static void test_invalid_shrunk_xstate_size(void)
 int main(void)
 {
 	ksft_print_header();
-	ksft_set_plan(2);
 
 	self_pid = getpid();
 
 	check_avx_support();
 
+	ksft_set_plan(2);
+
 	test_valid_shrunk_xstate_size();
 	test_invalid_shrunk_xstate_size();
 
-- 
2.56.1

