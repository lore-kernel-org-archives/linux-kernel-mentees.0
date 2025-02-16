Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1EA78F35
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 16 Feb 2025 12:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739708746; cv=none; b=oOdVcf9qOL8znemrj8s1Vwq/il4aY4Q7kmCEdv6+mBw5uMYs6mJh3L9rBj76YTNH93U6HGUFwoXlUsSa1KuRW2dPId+fWy0SIChlcIc3fr5Vx07KnkID1+A5cFtjvmWb6LFOvYldYV0UdUCKcux7GoqH6cbPs9R3Ue2bm3IMCu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739708746; c=relaxed/simple;
	bh=Bj76VLCbF+M23LqrthO9t0w/jK8xDXfTqynJtKAV3Gk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=F1LrcCV4XCOx9IP8AEdQIQY4H7AiceGvKDys3t+meXL7uwQIhsx1unnhn7bBC1QRaU6/ymqGkTL2QsAE3ozIitCUNb9BE31jNGxnhxNlEtsFxP96MgPzUCojNiR5dKIoaopDqieagbFP6jdeSyT2yLZntv/MAfj24YZJ40gpCp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flE8I66d; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flE8I66d"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3f3deb037cfso1445073b6e.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 16 Feb 2025 04:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739708744; x=1740313544; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tSnYjGPUnvBJRrlMcBwocb2X+d96z+Eph6pBJs4+vkw=;
        b=flE8I66dh/gObyo7NM96wu35IfKZknISYxxGCQIKqRFF2DqQvxGO4Hu75Txg9vfIxZ
         /2TAkAjIOGy2gZj6TnY9gpWj5tWh8nqAuI6e5fsLwai7OyT9QxI0XkB0x0fpmwPoRTvP
         bg74Vuxzp/LX36or53jtFR0CC8kQ9/COhcwOQ52Z3ezKLWRSAa3WkH8GbUikaB5fnBWs
         i2Yn3PtU7UISe8j08JMHVNFjZjkD68jXgNqjF1jYz00T74QAA2NOTxhXjrWZpWE8sv4n
         YuikffZ/DYAPBBLOZGoCdz+5PqrQntg2SzTkgXANHbDYeQKufDT3u3AoISUX7SU6G2NH
         Misw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739708744; x=1740313544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tSnYjGPUnvBJRrlMcBwocb2X+d96z+Eph6pBJs4+vkw=;
        b=Wnu6Q7Kabea7IZ0M7A4F3a9W4LWWDbCWFwqa6tC2qUvc4+YPYJHmQ8WPR1foTwpm1w
         5dd+/X9ZH+JUPyCiixhQYy6ioTtaanuKFiWbmBChgsZrtBC6mPLeC33ralPc4Mw0g7/X
         AGWvxNwG3PoYmcL5hoVCo5qihMxuJMy5b98LT8E2l4OnKFoe2ZvMD4A+OlnmIG0Z0kxJ
         kvelXXhN2NktjlPpKe95pL0xggYgiE2k8pQCy3wa71DT1eRlnBxDzTPtRvNTZkVHALYv
         R25q6uEmQdL+jImFyI7ZNJF+6UZWq2ofP3ALOJpEKLtp6736sHWn2GzQjO3DtGptQFb+
         Ip+g==
X-Forwarded-Encrypted: i=1; AJvYcCUi74xVMbAuCnohe1q2wkstScXUD2fkVNbyDl6Its0RiwNFr7ZldJe8AQ+ygJhQoAb3oiJlBcZhB3TqHnQemSOo91yT/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxU3wQB45ATnSEYjzFt1UxtpK3zwi3xGKs6VgEfwYOm5Eev3iYw
	LA0slfOiysTSXULFXdtEn8KHvVLnB+UeOdzRd3rxun28GcJDAUU1A4iJCPe6j1PHkigLUzhzLBf
	JB2VAmTuSmwQIIhVu6DNATGb34gY=
X-Gm-Gg: ASbGncsEBUlBC6aBjmuHTEy7m+qJcT9/lUAKa7GZMcyMXtg23oOEM7+ma2YLGu8qsOW
	D8sovdG1t0M5SW1XjJ90bmQiSdwUhg7mxdFmYQf85rMTcMQVnwsxJ/MRQ3Xh/JCIq7i72tMk=
X-Google-Smtp-Source: AGHT+IG8fOZSNe+eWtL5qllqzMlNYIgN/e+2mZts4Aos9aWvDH3ndhieI7Y03c/TES4ebjcgrxC7qTEJN3mojqppnoQ=
X-Received: by 2002:a05:6808:1529:b0:3eb:7ec4:f3ba with SMTP id
 5614622812f47-3f3eb08a3b8mr4435134b6e.2.1739708743659; Sun, 16 Feb 2025
 04:25:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Sun, 16 Feb 2025 17:55:32 +0530
X-Gm-Features: AWEUYZkR-AaxoUlta2McDAXfuoLGVt863RNRkh5_8FnckELfAbf--AAUl2c7nIY
Message-ID: <CAO9wTFgN=hVJN8jUrFif0SO5hAvayrKweLDQSsmJWrE55wnTwQ@mail.gmail.com>
Subject: [PATCH] selftests: net: Fix minor typos in MPTCP and psock_tpacket tests
To: netdev@vger.kernel.org
Cc: horms@kernel.org, matttbe@kernel.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	Suchit K <suchitkarunakaran@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fixes minor spelling errors:
- `simult_flows.sh`: "al testcases" =E2=86=92 "all testcases"
- `psock_tpacket.c`: "accross" =E2=86=92 "across"

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
@@ -28,7 +28,7 @@ size=3D0

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
  *   Open a pair of packet sockets and send resp. receive an a priori know=
n
- *   packet pattern accross the sockets and check if it was received resp.
+ *   packet pattern across the sockets and check if it was received resp.
  *   sent correctly. Fanout in combination with RX_RING is currently not
  *   tested here.
  *
--=20
2.48.1
