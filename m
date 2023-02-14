Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780D6C05027
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Feb 2023 14:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1B9B40237;
	Tue, 14 Feb 2023 14:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1B9B40237
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LBUCZvjA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SHVpMnbY2Lkt; Tue, 14 Feb 2023 14:33:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BDF4E401DE;
	Tue, 14 Feb 2023 14:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDF4E401DE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C80EC0033;
	Tue, 14 Feb 2023 14:33:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 021D8C002B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Feb 2023 14:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF69740B5A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Feb 2023 14:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF69740B5A
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LBUCZvjA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8vAKdZ1KMdet
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Feb 2023 14:33:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F98340116
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F98340116
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Feb 2023 14:33:34 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id dz21so5637607edb.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Feb 2023 06:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:from:subject:message-id:date:content-transfer-encoding
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EsLMvj86zzmCO2vfpg2bUdkj0KKOwYegzq4jwlHWKBk=;
 b=LBUCZvjAXOQz20R0G/92oq8ZjifAWrzTyxtfONDOj31oCjnQTwBAdEubeaw/m0F9t0
 U3oFtbcwU4DbqM8hUgoRozup+UQy0vv0guD039GzfUzanyLIwlkIPAdyaToqnvm8CDWg
 9NrIAezX9LIrFhojgvocPQ3JAcrweUYzdFrIH0qxhywDLFIhV8AeSCSS1JbStBq/kvPg
 rMIZs4NGZYuL/ZYDY8ZHhOq9M1HDDvZyM9HlEXa2HjhMGW6zCqDTbynD1wQlT9n/JdXy
 Yd0ou+1KbRxNDROsNRbPWSXzmutpqle42YVdCIrv2HMyXCarjeYpYsb/OCjZCEreytmq
 wu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:content-transfer-encoding
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EsLMvj86zzmCO2vfpg2bUdkj0KKOwYegzq4jwlHWKBk=;
 b=S87xxCK7jwsLZ0v4KiemVXxE3TctQyIKTWMuJT8J0829RR6aiASgQ+rOfj4wAdtzqA
 7Neyc6cfqvIEPn55W5K6gOOc10vXkwY2F2aO7Fj8L3c4nJNDNEGduZ9Pk4yUghRi8oLY
 k8DvuLk8sO6gTg6mbThnoGRjHtoYQqYh1uJ99wJbea9Cm1EvhACxylsEtzPK4flCdKyj
 sNkV2Q/iSv8LlRQ3toYHPYRX1P3fYoj8Xlteaam/4U5+FwuAFCTodmNgEwZsJ3dQho/q
 mvtmlFmRBORUqSwLw8F7r0boMN0HGLYaL/FghgKqHMsHZmD/Whi4HCvJTJeMZGQ4tqC4
 Z3dQ==
X-Gm-Message-State: AO0yUKV9dB5tF2LFC5enxEiL+YDWd2GFzx65Sp678v+OtnVNY+YWg7F1
 Py05dcsAcGPqSVizceCZoJ6KWtdcIA+oDg==
X-Google-Smtp-Source: AK7set93X6MsuFnXiADLIvC9WRR3G+KfGUyCDthV3k+OkaLFiSA7EHhWHzHj485C8+PTBXKJ+YtyDw==
X-Received: by 2002:a50:9357:0:b0:4ac:bd84:43e1 with SMTP id
 n23-20020a509357000000b004acbd8443e1mr2881701eda.8.1676385212320; 
 Tue, 14 Feb 2023 06:33:32 -0800 (PST)
Received: from localhost ([2001:b07:5d37:537d:5e25:9ef5:7977:d60c])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a50cdc5000000b004aacec09ca6sm8175382edj.42.2023.02.14.06.33.31
 for <linux-kernel-mentees@lists.linuxfoundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 06:33:31 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 14 Feb 2023 15:33:31 +0100
Message-Id: <CQICYMB6ZKKD.RTNW58ABNW4I@vincent-arch>
Subject: Info regarding "Write kernel module" task
From: "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To: <linux-kernel-mentees@lists.linuxfoundation.org>
X-Mailer: aerc 0.14.0
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

Hi all,

In order to complete the "Write kernel module" task we should implement an 
"in-tree" or "out-of-tree" module? because I know how to build the out of tree, 
but not sure how to do the in-tree. 

The things that it is confusing me here is that we should generate a 
PATCH and this assume that we should be in-tree, 
anyone has already solved this?

Cheers!

Vincent
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
