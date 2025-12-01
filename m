Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3316C248F77
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  1 Dec 2025 21:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764624554; cv=none; b=PMZyM5SHuGrDnLIo0W/0kMFcGvwAYLXFTA8DT6v5y2wIHM+d/SY7hDFhI7rW58tjp+WkJoWgQRRgzHCtNnOMezaKMleYcCj3RN0RGzlwKsZ5iGGLTTYA2hlfbNW/zdAKsu+db7bVNHX2PN0xvlQc2voxw76zN+AjnQno0WlAp3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764624554; c=relaxed/simple;
	bh=bOtOjd6JjwbAPh2xNBvn8IBjSD+6F7oZsr68VyfvX7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NhxWdVCVGBRc6zdJMrYndPmmpfg+eqHbz/y/wpNhhCc00GT/f0TD/XLpMF9Yl3e18aSVxuGxYbS3Rj/vtIL/hU6sODf+QMtSmZVoYx412qFS/Zs70G5zFEiL9CDud4lVVAzS5EwY5bCACjGvAAjakBprJKRKHzoFUjVmr+J1ars=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PO8n3aiG; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PO8n3aiG"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B953F40EED
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  1 Dec 2025 21:29:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CVnE-MWFwD19 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Dec 2025 21:29:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C30E240E1A
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C30E240E1A
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PO8n3aiG
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C30E240E1A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  1 Dec 2025 21:29:11 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-64168416cddso825299a12.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 01 Dec 2025 13:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764624550; x=1765229350; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RnmoayJSvzdqb3DFZ8NRtsHFlDAO/OQzvSg2v1kodIs=;
        b=PO8n3aiG8JP/OENsjX/JOyyoCyu0idbGLaHgCDfW4/nkW7LNlelejrtAvqpKGI2L6/
         2C5/B/XFcQ9GMKp8m+G7mltWEOklL0mCQELLRckaxRADUbBI/1+fJL6SbSnLBH6ml0Qv
         TI+c7+9tNlZ1bbLcsDJaDLj8QWn9T6VmBGOv0GlRjK8zusFbj1thhZgDdC3moSFGVDTU
         n4YX63DgmqXbCEg4+8ptEpm1q29NCm0Ogk4PBcSBUz0uS8sJFaGajWnMX9AYhzkQ3zc8
         O3b74BQgETj0zE0HjiYlZYaKD6qbFHsuTtS/h4vTvCrfCSJVjmWedM+/qw+CpO35Fu5R
         gIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764624550; x=1765229350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnmoayJSvzdqb3DFZ8NRtsHFlDAO/OQzvSg2v1kodIs=;
        b=mtdW2e1UAUTT3pbd7VSPNd2+oXHYfl8klTPpxonoEWLcwPsM/dNJxxtFL7VPvbTjnm
         YlqDzz5I8EERKIxY2tQIChSraqRGzXG4vdttjmOUsDEcWvg+WoCqK/dduY7vj42BYbl1
         qhXCYNuJm+YZ3g59QHnjpNx2HYcr1k2inLCso5nQgOdNwnDcIe0t6XFN9iipac1r3yJ1
         sLLbuo0C/OMbeIIk1bWziXqMiNAymhzGAfeG/IpoZycn5XtymhQ7puQDAIaEsgTSuTm6
         AX30KGumAmZIcmU7nTc907ShhPcarF3Djkasl0K/8dVB4V1f/iZCrRf6SfeSzqOGGVx0
         HIcg==
X-Forwarded-Encrypted: i=1; AJvYcCXrTnXb6kMCy8jVVd2dwZpPFeB73Q22LKF6ndVE+R1PUF7jms71ZSE61o11DJ58KrpaYX7Zkjm6N3qSSGheXZZ6Gc5e7g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxB5iboAZjffhtP0MNcgL1xsNpru+PuPUpA2MI1YRkg5EyLAbWp
	54zsb9cAgbTdYWqs42E0XkMZZelAvDh7+Bnl0Bkhx0djsyOwjlx160/C
X-Gm-Gg: ASbGncv4PxELA2XLED6GuUYZg807W52c2kc/SaaJZKL6psLncF3+VwshamL3KwXmllr
	GX+LRDWNpyQDrtx+gOIStdXXXMyTIyMy4Iv2TBycllaywLp5E+mUw5mH1Zwnn7WEp+B8NlP7eRd
	zlW+rQz5lr2MmoJFxng8D4hmlI2pOmLk1XeINtKuTxPrxIj8p5zZyV4nuvOBZi3eONqRI68hVgw
	JWfd5XJIiacRjOtyIJGV0o1ZEQv96RhGbQmuzuc+J4RK0YlpOMsbZSuYR0jY6vcGdfPj5vmWThA
	9HZBNoBW6WSYOPZIrUYXWUk/c7/nC9Vl5Qtm0O+z62BXP2wKaHf2yPxzwR1EqWqHCyRtY2Yz0Pt
	z52QN7c5ni12IEf2und+fpWSSE1QwijU8YLobduJghjibnTR4OLhZf9hsljzg1p+rwpDMKt/aw4
	I6NZ1FRRcmHya37Q==
X-Google-Smtp-Source: AGHT+IEDyOdG43yuRYaMbez1bnYjIxw/7tPACl84TupPKYcPO52lnJgZpf3YRgT8PjhGfPZVGvJjrQ==
X-Received: by 2002:a05:6402:2106:b0:645:4607:982a with SMTP id 4fb4d7f45d1cf-645546a2544mr20050925a12.8.1764624549492;
        Mon, 01 Dec 2025 13:29:09 -0800 (PST)
Received: from bhk ([165.50.39.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6475104fd7asm13519497a12.23.2025.12.01.13.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 13:29:09 -0800 (PST)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: slava@dubeyko.com,
	glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	jack@suse.cz,
	sandeen@redhat.com,
	brauner@kernel.org,
	Slava.Dubeyko@ibm.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH v3 0/2] Fix memory leaks in hfs and hfsplus 
Date: Mon,  1 Dec 2025 23:23:05 +0100
Message-ID: <20251201222843.82310-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Following series fixes a bug reported by syzbot which is specific to
HFS but this issue is also persistent in other filesystems.For now this
series fixes the bug for HFS and HFS+ Filesystems. Other filesystems
need to be checked for the same issue fixed here.

ChangeLog:

Changes from v2:

-Include hfsplus fix

-Align changes to christian's recommendation.

Link:https://lore.kernel.org/all/20251119073845.18578-1-mehdi.benhadjkhelifa@gmail.com/

Changes from v1:

-Changed the patch direction to focus on hfs changes specifically as 
suggested by al viro

Link:https://lore.kernel.org/all/20251114165255.101361-1-mehdi.benhadjkhelifa@gmail.com/

Mehdi Ben Hadj Khelifa (2):
  hfs: ensure sb->s_fs_info is always cleaned up
  hfsplus: ensure sb->s_fs_info is always cleaned up

 fs/hfs/mdb.c       | 35 ++++++++++++++---------------------
 fs/hfs/super.c     | 10 +++++++++-
 fs/hfsplus/super.c | 13 +++++++++----
 3 files changed, 32 insertions(+), 26 deletions(-)

-- 
2.52.0

