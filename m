Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3333C2E64E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Dec 2023 19:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhOMY/un"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81AC283F65
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Dec 2023 19:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81AC283F65
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QhOMY/un
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c2FNADMV143c
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 22 Dec 2023 19:40:55 +0000 (UTC)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D1C4B83F64
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Dec 2023 19:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1C4B83F64
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6d47bb467a9so2371307b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Dec 2023 11:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703274054; x=1703878854; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MgevCgufJPPvCi62nf9pb7fjA62h0EtwHE1dYgT7BS8=;
        b=QhOMY/unTadI9T21SYZO8NCT9C/b5jYyQVVmVZMbR3JoB8vdRGy7czqxB8XmyeAUqG
         4n5ifh2JaeIazvHreh9u/dHqRaytFLS/xlNs+w1dEwBYPgXQonHq3bWRQar5WxaBfE/i
         V/Orzr8u2ix0aGRIRAbp87Bkoro5SndkaNWGn0dwcSvaTdsHW1deAAGbv54NkOxb9Hoz
         G29dxTFa2U0qPBL2dfko95t2OOrjLLJezpe8VOo3Mg5bgFdA7fE82CbbcQhkzP46Qs1b
         IlmiKwdTdK9aQiGPnkzZtNHz2W/MQYDLgszzjc+W7joSVTyPkHSQ57NJJg3KdI0cxZQ7
         P9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703274054; x=1703878854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgevCgufJPPvCi62nf9pb7fjA62h0EtwHE1dYgT7BS8=;
        b=HOoF0AMrEhgcRQ+TbotP2kH3Ja+e3nXbzm0pImAIJNFDYejJ2ZC5BT3aqNJiGuLftm
         XprlpM7nw8QSPRHVNcA/4jiI0opE9U0I3R75WbuZGh7rYLpxHC3BRFHPkyrqcKAb2+EF
         A6iQybtYq9mLjiFYo082TeJ9W/UKiA4bxXY9n60kIgcNDX10hRRhb5djTkcCKShzl6dJ
         SnxHSvxUB9KOomRXGQ7d9sEz2Kuk8E9VWWOzvKcMSOI9B9B8RzKjOg+8/jpfuPdhJqvb
         DH5AVxRYrlEGduo9dKGGow/eNlJG/N7OpGqaxaZAcd+lgJZiaAsjgTU99Cfp0H9yABAA
         C4bw==
X-Gm-Message-State: AOJu0YwNR3sXFiSqBGATuzN91J2r6l06hdsdpu7MRC1VVUAuoBvO7+0E
	x0qBrah5tsMGGHIHm+CQnjw=
X-Google-Smtp-Source: AGHT+IEChco+TUdIxGydxRNJBv8sAOqipeg8/E4HlGZdHD5+cDoRWB0XW8k9CliFNZgR0E964Cc1mw==
X-Received: by 2002:a05:6a20:7287:b0:190:38cf:15b5 with SMTP id o7-20020a056a20728700b0019038cf15b5mr3663674pzk.20.1703274054099;
        Fri, 22 Dec 2023 11:40:54 -0800 (PST)
Received: from ubuntu.. ([202.166.220.102])
        by smtp.gmail.com with ESMTPSA id h24-20020a631218000000b005c6746620cfsm3630831pgl.51.2023.12.22.11.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 11:40:53 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hpa@redhat.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] staging: media: atomisp: pci: isp2400_input_system_public.h
Date: Fri, 22 Dec 2023 19:40:35 +0000
Message-Id: <20231222194036.1984-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The script checkpatch.pl reported repeadted
word 'of' in isp2400_input_system_public.h
as below:

'''
WARNING: Possible repeated word: 'of'
/*! Read from a control register PORT[port_ID] of of RECEIVER[ID]
'''

This patch removes one 'of'.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/staging/media/atomisp/pci/isp2400_input_system_public.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
index 447c7c5c55a1..523c948923f3 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
@@ -163,7 +163,7 @@ STORAGE_CLASS_INPUT_SYSTEM_H void receiver_port_reg_store(
     const hrt_address			reg,
     const hrt_data				value);
 
-/*! Read from a control register PORT[port_ID] of of RECEIVER[ID]
+/*! Read from a control register PORT[port_ID] of RECEIVER[ID]
 
  \param	ID[in]				RECEIVER identifier
  \param	port_ID[in]			mipi PORT identifier
-- 
2.34.1

