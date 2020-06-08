Return-Path: <SRS0=Jgkt=7V=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7FDC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  8 Jun 2020 12:20:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 945402074B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  8 Jun 2020 12:20:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIUAfM63"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 945402074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6732286DB2;
	Mon,  8 Jun 2020 12:20:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YncpvtY+P5aA; Mon,  8 Jun 2020 12:20:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EE8DA84EB9;
	Mon,  8 Jun 2020 12:20:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5B62C07FF;
	Mon,  8 Jun 2020 12:20:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28ECEC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 12:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1733486DAB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 12:20:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nhVOZlUMpGMp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 12:20:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9938884EB9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 12:20:50 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id d66so8471879pfd.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 08 Jun 2020 05:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NUHy8/ZD3/5DB3SagOLVHSDA2Gz3iOMx1TRgvgm8zm8=;
 b=lIUAfM638IJKndbvpf1I7Yn+LtWXZWOvffQYObnlxKzpkRO21F5+PFf8BInaOuKni4
 0Htl+8366xEehLlwNwHgGJEzRrYJAkH28e6z3NGSurqRVzSwvb5rqL0C3uTDT+UMl/0Q
 MErXTu9HjlaVrvEppJahCbxHP9BT64XrD2PLoMdn37MX9Wvqzjx5Cy7Ku2QKzOGiimp5
 SDmBuhW/fTU+jblZIcuuKNhnxKC2YcvvqM2NTFciB7fpAuYG4tt1uMwQP71NO/KG2YSA
 UTTnPn6SXH33gVHdEoCM+oZNXtY1ljmpK5/rutLKW4o3k0J2LqC5fyJ4SIgoJxPf9IY1
 sGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NUHy8/ZD3/5DB3SagOLVHSDA2Gz3iOMx1TRgvgm8zm8=;
 b=Rzc1JWpkX1EJYLR//YMTNH/gHcQNowgTEka8BZx6e7u51q4SdDyCTw+NDEcGRiebaI
 JvIecUjZ609JKqBdzJC1xSOxj/yssfRDCcvmqLWD5Tv4SzdyNV/EOYt3O4xuTD84scMs
 OYb2Whv8dIfh7cWtJmRT5PwTMewF1aCzRuZDqoLTHhPRjZTpcbJDEz1b6vWuE+du0/Y3
 q+nMMgB1FJpMFZmn2qxTBvwTinQy/kKr7uG8JHGYWYMi4lrc3D+sV/7eR9Nw5C+nmyAK
 hUuFEg9XgA9y4Mc/0wIiP+7giEfVNRg3cBpxseWv7bTmWKq4ihWecqpiytxMzJwvJqaJ
 MY8w==
X-Gm-Message-State: AOAM530f/e4qWEVbCmiD2lvFHYu94ObVuHCXNEOq8CoucQEI48ijyrF6
 ErSIR5d7/7ebwt0H2W6w6Jw=
X-Google-Smtp-Source: ABdhPJwOFZbHxZHeDDWa3YUg7Pgfc9KmDVhvD3dyKGdLQvvKT2Xa34IZtAEhJRdM5g4f9HDlMk7xMQ==
X-Received: by 2002:a63:7788:: with SMTP id
 s130mr19482086pgc.182.1591618850044; 
 Mon, 08 Jun 2020 05:20:50 -0700 (PDT)
Received: from localhost.localdomain
 ([2402:3a80:1863:7add:d8e9:7114:e8b0:51a9])
 by smtp.gmail.com with ESMTPSA id i5sm15747657pjd.23.2020.06.08.05.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 05:20:49 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon,  8 Jun 2020 17:50:33 +0530
Message-Id: <20200608122037.28019-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 0/4] parsing_c: parser: Add
	end_attributes_opt rule
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

Patches for improving the C parsing of attributes[1] introduced a lot
redundant code in the C parser. This patch series resolves this by adding
a rule for optional end attributes and merging the redundant code
together.

[1]
[PATCH v2 00/25] cocci: Improve C parsing of attributes
https://lore.kernel.org/cocci/20200528122428.4212-1-jaskaransingh7654321@gmail.com/

Jaskaran Singh (4):
      parsing_c: parser: Add end_attributes_opt rule
      parsing_c: parser: Use end_attributes_opt in decl2
      parsing_c: parser: Use end_attributes_opt in field_declaration
      parsing_c: parser: Use end_attributes_opt in cpp_other

 parser_c.mly |   96 +++++------------------------------------------------------
 1 file changed, 9 insertions(+), 87 deletions(-)



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
