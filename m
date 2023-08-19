Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10F2EE49A3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Aug 2023 19:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F294941BB1;
	Sat, 19 Aug 2023 19:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F294941BB1
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=gxUCaWSE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id in1Ly2_j8G5M; Sat, 19 Aug 2023 19:50:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8ACD541730;
	Sat, 19 Aug 2023 19:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ACD541730
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4843EC0039;
	Sat, 19 Aug 2023 19:50:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D706AC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Aug 2023 19:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAC1B401B1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Aug 2023 19:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAC1B401B1
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=gxUCaWSE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id USDpDw6PaeTi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Aug 2023 19:50:23 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C050A4000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Aug 2023 19:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C050A4000B
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fe12820bffso19394635e9.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Aug 2023 12:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692474621; x=1693079421;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sSB6bHkjwrLrFphZRXjaDm3kSiCaocff/7800VaCd8Q=;
 b=gxUCaWSEn7y8qaC48/Ir3tNWSAROgPfUfqvIKkyE+gRVYZPhjJ03GFaN+8tnraN79e
 215Yp1dgiehqEmpGGHGLDCCF4SDEwTUC/z7HLOhqLD5zrsNj/7LmI/7ma4NblW/opOqg
 bQFVrmpiGSmPbZ2Yg5boXNgBv8m4wT+bVWuJxsHz+UIKd9LGyb8pPUvqxx5qco3gv6Wv
 n6HJtAo55rpgB+aCczFTOiZFEvKDbrcwOFP538A4l/z/0wTDZZib2RxZhOX1UDGGUmz4
 5L54+7N/YAfeV7+rfPelZlkEAV8A/rsDlOmoiH+oQI4x8PHykbo9JIWuT9PO/jpJz2WJ
 +vpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692474621; x=1693079421;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sSB6bHkjwrLrFphZRXjaDm3kSiCaocff/7800VaCd8Q=;
 b=QSeuhqwkpwelBho9NHcSQuWbi7kX3Lm5CKfEV5KNz5z0lRFyg72a1SObFWMyp44ID/
 jxs6NhUek5nPO9ppQ/FcIu04HcKtuPCSxUgKYwRCrkeA5h7AcTnk/B/geO4hAHxCRZE2
 1ATgI2jc8F8qhqphIRSDiskgHtQG2HON1P8Orsegwtxaic8YBjtG39jrxfURbm27ITnC
 eachkcaeFBN1uc1uQueO6PGw2USsAtsNdCZgE9pBbvnKeCbSe4rBbfC/PcXjrGBoTVzX
 zKr61o8+R/fX2agpqEuk5H5ikygVuRsZGu2A1ESGWGMACnJvJHA10fUWbHurAGGEVwi2
 T0Gg==
X-Gm-Message-State: AOJu0Yyfq4+SrJ4ApaYtLvta08g5gfxrf7w5K4uXJwbVJpGe5xYNdPhH
 nMkZfWb947XgbW/Si21EJlg=
X-Google-Smtp-Source: AGHT+IHahhec10BYrPqz/QP1HfNcaB3/uicy40ATMZ7BLndPcptrIvIFgo8k7y6MTcL3w2uqTpqEmA==
X-Received: by 2002:a1c:6a16:0:b0:3fa:98c3:7dbd with SMTP id
 f22-20020a1c6a16000000b003fa98c37dbdmr1935691wmc.41.1692474620596; 
 Sat, 19 Aug 2023 12:50:20 -0700 (PDT)
Received: from mmaatuq-HP-Laptop-15-dy2xxx.. ([5.194.84.172])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a1c7913000000b003fe26bf65e7sm6861382wme.13.2023.08.19.12.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Aug 2023 12:50:20 -0700 (PDT)
From: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
To: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kuba@kernel.org, netdev@vger.kernel.org, willemdebruijn.kernel@gmail.com,
 davem@davemloft.net, pabeni@redhat.com, edumazet@google.com,
 shuah@kernel.org
Subject: [PATCH 0/2] selftests: Introduce common min()/max() and apply them in
 net tests
Date: Sat, 19 Aug 2023 23:50:03 +0400
Message-Id: <20230819195005.99387-1-mahmoudmatook.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

The first patch introduces a common definition of 
the min() and max() macros for use in multiple files under selftests. 
This avoids the redundancy of having scattered local definitions 
and prepares the groundwork for other files to simply include kselftest.h.

The second patch then applies these new macros in the selftests/net files, 
replacing the ternary operations. This directly addresses several 
coccicheck warnings, making the code cleaner and more maintainable

Mahmoud Maatuq (2):
  selftests: Provide local define of min() and max()
  selftests/net: replace ternary operator with min()/max()

 tools/testing/selftests/kselftest.h           | 7 +++++++
 tools/testing/selftests/net/Makefile          | 2 ++
 tools/testing/selftests/net/so_txtime.c       | 7 ++++---
 tools/testing/selftests/net/udpgso_bench_tx.c | 6 +++---
 4 files changed, 16 insertions(+), 6 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
