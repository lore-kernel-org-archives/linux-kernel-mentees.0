Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5296F20CCD3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Feb 2025 23:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740441019; cv=none; b=NtOG3vCEJR/cu1mozTjnEd8SNiOp2n5IRujwIPitB6aG4FbCW7KJ5MW3Ru6Po/rStQsHXr11kBARlN7ZOX8N32BWJ8+iVSW7P5FV7hIZZ1voJvoTIlM58jmZ3ZaMq9zaE6hzBvgtrHGLgOsbwKdNUqe/CSI/5Xq1rd4RNH+b4OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740441019; c=relaxed/simple;
	bh=B8KYFDFY6aAz9K22ud6BAB+fiNsY/XqDHGMOB2c15xI=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject; b=M9cKGTd7IDoMHwfehYXG9SCyWfcfLBslvuNHWIkQUNC9EJ/QOAntG/+Q2CMlVPpBTqGe5x2pmSJr/+oP2ZtqfxM3L/cAY+CYVv9MxhI3pX7pcF9hAclRr8S+2Sdl8vcia4J6ch8nhfkOJrkQPjgIQ+zZzE0/Hk3rcxWROLcQURQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3/MmD82; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3/MmD82"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA2188100F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Feb 2025 23:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLwbIruT8jt2 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2025 23:50:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=gshahrouzi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 241EE8133C
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 241EE8133C
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P3/MmD82
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 241EE8133C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Feb 2025 23:50:15 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-471f257f763so50437881cf.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Feb 2025 15:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740441014; x=1741045814; darn=lists.linuxfoundation.org;
        h=subject:cc:to:from:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LNfkARXli3uVvFnrZ1vZRAcjsGQLR8DVcO+Dhioc7z8=;
        b=P3/MmD82dombPPC2igGEmB6+KHFOwLQB54L5VxxJh3j3eM2cQw6rw+1hUF6zlMTc4c
         sRoq+baUhUl5f8keE64K8/nIjOwunWjMTZ4YDV30Fka8xsVCJF7RRUhRB8eRYIrd7xmV
         SpD+PNpM463QxbuT1lHGa4VhxqrDXKzHwg9blkh/KLWxO6mrQb0du2ZQQ5HNp2MgJh/v
         /+i+8D4L4e+LboXx5p7czBb8eGaamtcwblqmN3B9E4AAO8RGuPxg3zsCSyqDCFS/4WFy
         QhN/rLpfufZRzwPL+B2lTx9ETX/UwpgFWbS8/mX5nAKmMDRlrN/zWB8DocejyR0LaSN0
         jV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740441014; x=1741045814;
        h=subject:cc:to:from:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LNfkARXli3uVvFnrZ1vZRAcjsGQLR8DVcO+Dhioc7z8=;
        b=ra4mWwt80d6og1qlRl6w1nO4mjT8DkfZPt5P0HzJN4Z4a2zo6xN8sJs69eaHGVFDP/
         YFg4mdslwFEBA+iQQc1B9fTzGKYHgq8qQwl4lytWAcNPgV/e9TmwK6mLy/UmSYYLI9JD
         PI38YAlH6JcePsuOEZZoEE4ZITXRl6OVrHYe/LXCbhkCy+68vKhr+qrt/CjR3EfC8CRs
         payMe83IKlkpN3fKIrbQGXSh6+yvhm7B0llILZwjGtROkX+XAqxz66ueYJGS80UQtziI
         iLYzvuqvj+eZt8PtipTozfS6Btvr2J9Y0sUwCVpOqUB/g2u3P2eK0I8EyiYJ7a5yu4h8
         KGwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwUwwDp9I/IYBmbhpEshOc+nzS6sBZYahTEpwbjRVAmNPLVis7FBdfcOENjeNbi6Gw4JtvLOGB+cwrG23c0exaqJxYqg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwTOx/XwkRB2C6cwE03z7FoapwA9QljmyDKY+mMIQMsjs4eKQ+6
	KY9lZxZwqr4Z73JMNpS1XbGcOw21Xdxl162Avs1SFV6pv/Dyx+WE
X-Gm-Gg: ASbGncvBGnxffOH5L0aaumD4k3BeLn6w03SemO5EoSCXpSlYsOrSF1q+DI9yihWPXLQ
	+umGuvKUyT5fDfoCAfrFqPd2C9Cycb9qr92nyZGgESAoLKhP04xC/JuQgSzLxNvHG2De7C3BEg/
	s8zW+HUJYIaJyEXkq+ySYaiQvWK3vo/A+ofaxfeRYA2B3ajCyTfVbPuwBET2lAxqzU4Swvn8xyw
	puZCoE3gYVxpdAjbYo5zScuevOh3BKrXPOt+T2UMgdt4eAmPMUstHSkB1NreMBQNQCUwACjlMFx
	1ocDrCRFR74bRqmEsLYSPUgcs7WPtyRKV2HySbHax0ylYYV32gouoFgXUNnxCssFIjM=
X-Google-Smtp-Source: AGHT+IFEpnzcYWehzDJLiUmDa43uEZj2rwjWrAvQaC9BmR0P6FPz7VDzsr6K09MY8ZmNZeqrdpFfPw==
X-Received: by 2002:ac8:5b91:0:b0:472:133f:93ae with SMTP id d75a77b69052e-47222965e5emr198262081cf.48.1740441013701;
        Mon, 24 Feb 2025 15:50:13 -0800 (PST)
Received: from [127.0.1.1] (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47378084493sm2539351cf.70.2025.02.24.15.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 15:50:13 -0800 (PST)
Message-ID: <67bd05b5.c80a0220.205997.19df@mx.google.com>
Date: Mon, 24 Feb 2025 15:50:13 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============2672866445194770799=="
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: gshahrouzi@gmail.com
To: linux-kernel@vger.kernel.org
Cc: trivial@kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-doc@vger.kernel.org,
 corbet@lwn.net
Subject: [PATCH] Docs/arch/arm64: Fix spelling in amu.rst

--===============2672866445194770799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

>From 748db76c8e9f6e5906be0033dcdec9bb5749b303 Mon Sep 17 00:00:00 2001
From: Gabriel <gshahrouzi@gmail.com>
Date: Mon, 24 Feb 2025 18:09:26 -0500
Subject: [PATCH] Docs/arch/arm64: Fix spelling in amu.rst

Change though to through.

Signed-off-by: Gabriel <gshahrouzi@gmail.com>
---
 Documentation/arch/arm64/amu.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/amu.rst b/Documentation/arch/arm64/amu.rst
index 01f2de2b0450..ac1b3f0e211d 100644
--- a/Documentation/arch/arm64/amu.rst
+++ b/Documentation/arch/arm64/amu.rst
@@ -80,7 +80,7 @@ bypass the setting of AMUSERENR_EL0 to trap accesses from EL0 (userspace) to
 EL1 (kernel). Therefore, firmware should still ensure accesses to AMU registers
 are not trapped in EL2/EL3.
 
-The fixed counters of AMUv1 are accessible though the following system
+The fixed counters of AMUv1 are accessible through the following system
 register definitions:
 
  - SYS_AMEVCNTR0_CORE_EL0
-- 
2.45.2


--===============2672866445194770799==--
