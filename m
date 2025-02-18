Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626D622F3AB
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739870904; cv=none; b=tt4P9ASWLSfjEYzJqgjtDKsCMS6OGSr+bK/deRwH2RB0aoQt8tnz40IAjFfJJkevS1w46eoy8fuymEVLgyxrOboDX/xB7bBPP4Uz7594vP5VSqZBt8krPARt9/m+9vDRFQcpX9hm+XX5PAlvdwIlAVrmo1qIZJVrGNP4/dTqKao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739870904; c=relaxed/simple;
	bh=KUCO7GOcoDrDHadjAC27o2CRSYfaHDgMDjMGMYIWFcw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=JNeZBYHX25aWWOmhEK2KAcrPfHs+X5GRrzqp6iHoSMHC7uQgwR3p1TcMc5E7AV8f2PrPs8aQnRAkR7JDgH/xwxY4+yCDVyTZ5thXYpGDkA3L3zJbD6RPsYDEi6chpJsp8XoFbNWwimEPj8pexq9R3mXnYmG6e0ObaHo1BC3xSo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZhhUC2u; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZhhUC2u"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-727090df861so1126155a34.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 01:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739870902; x=1740475702; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8kJMtWw9wVrl3aRZwWKVOYpt3qrRhCd81TsGEYFpLTg=;
        b=bZhhUC2uSm2KVJpu27FJ7LOUVsm8e+AjZqpHSc8m+bgQx062I+3RYJz/lIF7jxDQzO
         2pqGB+/3KIvCRqtHVeg29Dc+jJR2hlgJpMxJPir2pyb1xNwwN88KDXnIz9WkwP7mSMVP
         8Z0I3uoNyTtDY68XEweAgE4Wbul85ppKXaIXDxnxl99hHCVL8ToC1kcyvip4JEDsS4Mc
         vI0vUxi/tlG609rp+WfjXCLRExb/OmLNz08GiQSo7k7ggevdJ90A8iKHtIMyjwQ2rMv9
         TiYYTv33X181ldLWdYWCnwNqdnvHudYHduBQLVFN9dAM9mcVciAygi++scG+h9/sujTX
         OkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739870902; x=1740475702;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8kJMtWw9wVrl3aRZwWKVOYpt3qrRhCd81TsGEYFpLTg=;
        b=fOpYufBsHaoZtgTfI/K4eCazsJTKUrGIo2HN600uuE3/0tClteMQ/aP5WgEzO4isRS
         33A5qlGnTikhkbhAbaHcXe2P+AldeVwsiXi8g3JLVgs2MP5ryltVbmxF6occZHeYkWUN
         t5Ism0haDumh3lqD5B+AkI3XETJEJvGCngdj3MNXZTMSG989VJGIfhDEx4LoaEJEaEoE
         NkKP/+bEZtyWYyTVoA6jw9NG3bT5t3sCIuIYnBfbzJhugWFPg67elr/B04Wzz4xFPmeZ
         wU5if1YkJ2YYnwoafuwijEJfcWJ6cH2jeRAo2aUJDjRFpzJxn2tcu+e7eLf44rR1c5/3
         bgTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbiJxzhhyoWBp96m7quGxtSsU7HE2YGpfHMD8YOVnjlBo23gXIau06FxjqjK3TbXCMpZ/DCU+pU3BY8NuoZ6zcrvbshg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyiytQMGV9poGzfNgMQgyx57idT0ETNiv3O6D29hNp1L1xPSMzb
	HQ3jYLFJMBwXb5np1OnOOyYZaxQaTJqK2ps5GAWBRZQlZH1qK/cYUlGJf0btU+AsyaABVoJCEml
	i29Fi37PvR3y33thQpB3mqHpdHMY=
X-Gm-Gg: ASbGncthRRa+mJ+ZGfREonrqZODoPPhZTFSSq4mFCiBrywmQoz5KCP/A/T1KkfMhN7H
	7lBh+mNQ0sJqaEXve9h/gtA21X2kwiOm2ynN2xeFVkFBBRQKcMOZvrefADUQhz8whaI5L0O4=
X-Google-Smtp-Source: AGHT+IGbMnXi83Muhh7hozQR7z1/wxvHIyNCpzQKVTEOGDO+J9syLNm5krScvYcmKeztpkeSfzp0rQUdKL4bvpaU70c=
X-Received: by 2002:a05:6808:2025:b0:3f4:28:1cd6 with SMTP id
 5614622812f47-3f400281de6mr3182376b6e.39.1739870902398; Tue, 18 Feb 2025
 01:28:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Tue, 18 Feb 2025 14:58:11 +0530
X-Gm-Features: AWEUYZn9N8YQjSA8rz4TzhThrcXz6tH7kdaOCaUbGFtWZGGJO-UH_9KpRuvxN4s
Message-ID: <CAO9wTFggVh9LvJa_aH=dDBLrwBo8Ho4ZfYET3myExiqf0yfDCA@mail.gmail.com>
Subject: [PATCH REPOST] selftests: net: Fix minor typos in MPTCP and
 psock_tpacket tests
To: netdev@vger.kernel.org
Cc: kuba@kernel.org, horms@kernel.org, matttbe@kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Suchit K <suchitkarunakaran@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Fixes minor spelling errors:
- `simult_flows.sh`: "al testcases" -> "all testcases"
- `psock_tpacket.c`: "accross" -> "across"

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 tools/testing/selftests/net/mptcp/simult_flows.sh | 2 +-
 tools/testing/selftests/net/psock_tpacket.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/mptcp/simult_flows.sh
b/tools/testing/selftests/net/mptcp/simult_flows.sh
index 9c2a41597..2329c2f85 100755
--- a/tools/testing/selftests/net/mptcp/simult_flows.sh
+++ b/tools/testing/selftests/net/mptcp/simult_flows.sh
@@ -28,7 +28,7 @@ size=0

 usage() {
  echo "Usage: $0 [ -b ] [ -c ] [ -d ] [ -i]"
- echo -e "\t-b: bail out after first error, otherwise runs al testcases"
+ echo -e "\t-b: bail out after first error, otherwise runs all testcases"
  echo -e "\t-c: capture packets for each test using tcpdump (default:
no capture)"
  echo -e "\t-d: debug this script"
  echo -e "\t-i: use 'ip mptcp' instead of 'pm_nl_ctl'"
diff --git a/tools/testing/selftests/net/psock_tpacket.c
b/tools/testing/selftests/net/psock_tpacket.c
index 404a2ce75..221270cee 100644
--- a/tools/testing/selftests/net/psock_tpacket.c
+++ b/tools/testing/selftests/net/psock_tpacket.c
@@ -12,7 +12,7 @@
  *
  * Datapath:
  *   Open a pair of packet sockets and send resp. receive an a priori known
- *   packet pattern accross the sockets and check if it was received resp.
+ *   packet pattern across the sockets and check if it was received resp.
  *   sent correctly. Fanout in combination with RX_RING is currently not
  *   tested here.
  *
-- 
2.48.1
