Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B496DC25B08
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  4 Aug 2022 23:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 375B98321B;
	Thu,  4 Aug 2022 23:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 375B98321B
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZP9xg5PR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6zpYmm3dPZ2P; Thu,  4 Aug 2022 23:08:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5D33882EF0;
	Thu,  4 Aug 2022 23:08:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D33882EF0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 184C9C0033;
	Thu,  4 Aug 2022 23:08:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94F44C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 23:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 602756F914
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 23:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 602756F914
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZP9xg5PR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Gdyq1SJq27O
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 23:08:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEA6F6F912
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEA6F6F912
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 23:08:01 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j7so1403095wrh.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 04 Aug 2022 16:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc;
 bh=+ElDsm7N+LBw7xETToduf1RcvU9bYLaEIprNs6yrJOg=;
 b=ZP9xg5PRIrTk1XsrOkgn9OuhDioeBCEfse9XDrrHieUikWuPeYVnQX72cnwQNDkoRV
 yVFXBI7TFoeal9bJfOipTYlAxjHeNqxQKYlzWcVJJfwHKKxwB3l6pAsmyKMh5Iez4aKd
 0vJDzqfbfu2otvaWc5wD/G4RvTZpx1js8VGRFYE4hKi6C+y9SrIMS0nKw1Uc/Pg5p5Tz
 +ppJYPBdeRJe6Dxh5iIrbd1cR2T6zQoMDDlbQPpPLFrwzPuFMzLIzBsmMZgoM1D09TqI
 +7jU4TDYW2O5X3DxKIo3mNDaFu/T5/lXJisL+boGiwCyDJB8Y0/AzFUIuM6AlY1MgjZk
 6mIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc; bh=+ElDsm7N+LBw7xETToduf1RcvU9bYLaEIprNs6yrJOg=;
 b=Ns6eZvUOAGc7pI9qx5znWS6MXAvUNXndnI4tD59m0hc/s/Xc1ukF/joSoGDDQ2vHIu
 QxFAWk+OU34wrSw5kIgOucyBYbcut9qLL6VQUCYdJ31P2f7dRzedu5Mes6HuB1TQQBjp
 h1OK4riEqwiyPtbzAM45bh6paPDUxRajpSzyIujRqUd/c+8ViRA1h2wR8YOISKHsnlIB
 0ukCQsUsHgz/AIPlPMtODjCfYB3UdVb3JtoY4l0fJeb7D1HGhdzzDcSaeGcEFk+ufBvg
 ccwfdp4FdDfAyxHLsuNmWT7CR5KUuNWh6YPKlcmPRrHGt+5bxwkH+8Kfi5BfbDySTaK8
 oXnA==
X-Gm-Message-State: ACgBeo1qrkgkdffjaxgW+/xqU2LVdqNSciiRHg8Xy36YtDusEBWEREgq
 FV38WVk+VmemFCQwsp6hv0Q=
X-Google-Smtp-Source: AA6agR7HGVRgjgUt8wmmepOzUtJL6HOwaUXnuV31jCdwJt4yvwvkT9FYGhISLV5zLOgvtz5U7r0cPQ==
X-Received: by 2002:a05:6000:168e:b0:220:87da:c3e4 with SMTP id
 y14-20020a056000168e00b0022087dac3e4mr2506310wrd.559.1659654479798; 
 Thu, 04 Aug 2022 16:07:59 -0700 (PDT)
Received: from localhost ([84.255.184.16]) by smtp.gmail.com with ESMTPSA id
 bg40-20020a05600c3ca800b003a2ed2a40e4sm8736004wmb.17.2022.08.04.16.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 16:07:58 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 05 Aug 2022 02:07:51 +0300
Message-Id: <CLXMEQRZRKJH.196H3FP8VFR8B@Arch-Desktop>
From: "Mazin Al Haddad" <mazinalhaddad05@gmail.com>
To: "Mazin Al Haddad" <mazinalhaddad05@gmail.com>,
 <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2] media: dvb-usb: fix memory leak in
 dvb_usb_adapter_init()
X-Mailer: aerc 0.11.0-85-g6b1afc3ae3d8
References: <20220724214100.593287-1-mazinalhaddad05@gmail.com>
In-Reply-To: <20220724214100.593287-1-mazinalhaddad05@gmail.com>
Cc: syzbot+f66dd31987e6740657be@syzkaller.appspotmail.com, mchehab@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

Hi, did anyone have the opportunity to review this? Any feedback would
be appreciated.

Thanks for your time!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
