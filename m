Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406AB1B95C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 11:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707911348; cv=none; b=WtnL/LEKAXT5+ds6zA2D4sm8JD32hxZYx548o1Snk+5JBHHEDywIdFFg/O55w+G6lef8yo+tD83ptTn3m7b+JEulsqt+lJycOTCIOYqGtuKLo/vgpuIkiLtTtXJIbIUka/7jCsNQxpFjLRJYa4VrmL+qFHAu42FzwhksoI/Z/7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707911348; c=relaxed/simple;
	bh=LFUX736l+7oaDPiQ2/cv39/GG0ZlZG8uOJDxPrD37K8=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=Eb6ZP54kZ9UzM6eR4NAXFqCpxUSTXd5Y+bE4LJahx3B+q9k/36ecmzA37rZDPSFsLSZF9Ub4OLCnOErEu+s6MD2wlsvZuPrkGOPOBpCUoNPq+L4EYpOAR8NU9p0a2DcuHhXMPW2KCv1ylQnMhmBXVuHL2FyyL/zoGcfnH+O7aak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=aVkV5/HB; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="aVkV5/HB"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with UTF8SMTP id A652882389
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 11:49:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 2.236
X-Spam-Level: **
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with UTF8SMTP id qIq1w24dpF6N
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 14 Feb 2024 11:49:06 +0000 (UTC)
X-Greylist: delayed 428 seconds by postgrey-1.37 at util1.osuosl.org; Wed, 14 Feb 2024 11:49:03 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9823E82373
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9823E82373
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=aVkV5/HB
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=162.62.58.211; helo=out162-62-58-211.mail.qq.com; envelope-from=ranpark@foxmail.com; receiver=<UNKNOWN> 
Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	by smtp1.osuosl.org (Postfix) with UTF8SMTPS id 9823E82373
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 11:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1707911333;
	bh=IqPj++hQCse/aDWWpJcJlHZJY5uyB9Px2Kbm49ONQoc=;
	h=From:To:Cc:Subject:Date;
	b=aVkV5/HBAWwPs9tLeMOOXoiVqmbnSLFx34FxinJHKYCkw2zFIxZKyi8XaKycazmS7
	 Igqs9uCw1NKzKtISrZ1x5KSkX2mjnoSMTj/2YBr8mNuXQ0YF9W4uJyILyI9oaLmMQY
	 TvI5m0zW59O2I13PY5+goWCpDhB2PUW/U8yxkYKc=
Received: from localhost.localdomain ([139.211.127.19])
	by newxmesmtplogicsvrszc5-1.qq.com (NewEsmtp) with SMTP
	id A1B82E12; Wed, 14 Feb 2024 19:40:27 +0800
X-QQ-mid: xmsmtpt1707910827tfu4md7a0
Message-ID: <tencent_3EA07E65C43816C2A8402DC655CF98916B06@qq.com>
X-QQ-XMAILINFO: NS/uTgoT3J9SWA7aNgfb6rApnx0CFnZCTxhlJ+RAzui6Tkkknh7/AianrenGJo
	 pJTQpGG0VgzGGnZt2ulNWNg+4B0uGmWFJJ+BrVgcqFbcotaAZlMSfnlLuP+Rpz5mG9HV08yXBRZ7
	 WSKuQZBCccGxHQO15Pew40RSvRdnJpn2CO+gNs+euVHbNv5lCuhGkCE38bH+GBHjKbuCUgXm+fzi
	 6qxLOGsVBXhapJsUwKQ2PsF7ZvFMjKyZEA2o+eG2bH63X94McYIgh+ctIFgR+YgwCl1+atRONHYh
	 x8cK9R7S9mMUS7G5KfsRyP5SoJn2hkFN+mvqby1CwO3mrZNHsFOU9ITJYCJI6ydbKEn+7Y8CHny7
	 8EbkeelsWuwKXJ4J5tImuQMmKvAWtNMxzcpfWy0pN2EbswNxm9w+TQd+ZTjzKnkASG0Kk6uW6/S5
	 TH/4I1mlR2qjPZmaIZZIEesIMH+rIox1x1XcWt6tUkD2mS+vBrEV6QDv17Q16a0+b4Y3W7Mf3vQl
	 tFmyQ4k6IWGUhi6KSY0LkqsF++KpfnFmG3MLFv8/hgtUhEgSFWA0YLX1cySev5xsMJ6vNizPgZoY
	 3oD7hEPbOhUq+A0aDln4/Q5cee7o3lgMU4FpMVeGIXrXF5eyAiebDmgFf65HNrJc6ATShjcj/WJ/
	 PTx00LXWnSw+/LGJg86+vEdjbfDZzNdmSApFTrtQJn2RxqLM1YkVcTlk1CQGbCAv6z2253PeP9bY
	 o47qZw86lhQFTaj3SxSZCAijq6G5ZYbe0TCnlw2LAWqKb+YaxUUatchCUD59bUDQnODGzphDPVVH
	 EGjnNDQuDGCroefTpvQV6GdR0KErdD2GO0g3x5mPiM3ANfuZCJbEHVtXFWq8AxdvqZG2InrVaUJ+
	 Fya/kTUQXYO1bpM24lAFyY+uLs1hZ0m7zEUyiXlzmQwI5vKVUZHeGTxlSLPWR8k3uH5DzlgDfZKw
	 q6ZlkGgTyp32BoYfJqf+eIoxXRN+axXO69N1qOKIyISGBSuqzbjfM0o6GINluD
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: "Ran.Park" <ranpark@foxmail.com>
To: akinobu.mita@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	"Ran.Park" <ranpark@foxmail.com>
Subject: [PATCH] Fixed case issue with 'fault-injection' in documentation
Date: Wed, 14 Feb 2024 19:40:08 +0800
X-OQ-MSGID: <20240214114008.17986-1-ranpark@foxmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the 'fault-injection' subdirectory, the first letter F
is capitalized, whereas in index.rst f is lowercase, but in
index.rst all other elements in the same column are capitalized.

Signed-off-by: Ran.Park <ranpark@foxmail.com>
---
 Documentation/fault-injection/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/fault-injection/index.rst b/Documentation/fault-injection/index.rst
index 8408a8a91b34..a6ea1d190222 100644
--- a/Documentation/fault-injection/index.rst
+++ b/Documentation/fault-injection/index.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 ===============
-fault-injection
+Fault-injection
 ===============
 
 .. toctree::
-- 
2.34.1

