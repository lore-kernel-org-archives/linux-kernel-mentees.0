Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CDEC0015E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Aug 2023 09:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F9BB41766;
	Tue,  1 Aug 2023 09:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F9BB41766
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pBRP5vOd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jlFkY3-faFP4; Tue,  1 Aug 2023 09:41:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1309A41796;
	Tue,  1 Aug 2023 09:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1309A41796
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2F1CC0072;
	Tue,  1 Aug 2023 09:41:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68385C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 09:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F75F60807
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 09:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F75F60807
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=pBRP5vOd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iBqdiROa35Ll
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 09:41:19 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4635C6112A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 09:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4635C6112A
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fe0c566788so8961029e87.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Aug 2023 02:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690882877; x=1691487677;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6vSxLznbxV6UhcVbmR/3kOcWh+jlU5tNLrgmhhqNzzU=;
 b=pBRP5vOdiKTbO0F2uHoZsRM08xs3VZh0Yyt14eMDkqL0HCQrCxu310PqI5oXGoL4V7
 T1Fs3BtLzD1A2jVelpnj7O4Psb+7GiMjHkeiRPOojir1STiko0YLyNGOKQf6xHH31H+R
 7bNG5/mTQko5mLfqRh6K6doE+xzxIaosGtePVu5Xiwr6Z50rN4cTEg+2+87E2aTfXci1
 wyu66smABDSIAs1OwHR+jKqrW5JrsmWKDr8TVZPkOQp8B0Vbkso3S73etM211yyhiYXh
 oBw//DBWvxRKwVAHmMaNKwz+azF671p0z/OVnc1SKAQEw2ZO6/WT7Frr9Thp08jskHjQ
 L4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690882877; x=1691487677;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6vSxLznbxV6UhcVbmR/3kOcWh+jlU5tNLrgmhhqNzzU=;
 b=YX7Hyz+625MY5Qipu+dM8nyco3kBJTBedL0Ks3e6lgVkQyxyEYfs4SmAvcKxO2EzxV
 o/siNG0SX4kCdfQEFBfnh8rGpEX9Pi5Pf0XgCe0/x8oLy6wBehpCrlQa4Rlx+kQgmwqq
 Y52MjNGm8lmqIfcYQ47sB3O+wSwF+sOA9gK2g9tf0skgh8yHNdBScL2+csYrSHB8noJn
 8/xqMsgJdqUEJxSg6qsdAuuOBytvLE+pZlOgH/YZOup5nqTcNessQsCbDHB8IZATDkxD
 HQ8YRO+pfpYUuRyn2C0HJEj9mH1ELV0xJVot8TlfE4SrGaqXOdFK/Y1nB6B39hYP4HIk
 6xYw==
X-Gm-Message-State: ABy/qLY4dXgaiTDQmj4QQLLdkFK5CynrAExmaFXJ7BOrxHyHfeAOvJvQ
 v5fwGd2O9OcFgN1L+MV33QGlcQ==
X-Google-Smtp-Source: APBJJlFo/hsqyaZkfgWgwnYmtZESbaEH40QLXEEvU9smE8JKc0sNNjD7PrQns21W5fYQqhrIqK80ng==
X-Received: by 2002:a05:6512:3a6:b0:4fb:8aeb:d9be with SMTP id
 v6-20020a05651203a600b004fb8aebd9bemr1512703lfp.30.1690882877106; 
 Tue, 01 Aug 2023 02:41:17 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 e17-20020a056512091100b004fce9e8c390sm2497513lft.63.2023.08.01.02.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 02:41:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Atul Raut <rauji.raut@gmail.com>
In-Reply-To: <20230730223915.13157-1-rauji.raut@gmail.com>
References: <20230730223915.13157-1-rauji.raut@gmail.com>
Subject: Re: [PATCH] nvmem: u-boot-env:: Replace zero-length array with
 DECLARE_FLEX_ARRAY() helper
Message-Id: <169088287464.48603.5050056188620882666.b4-ty@linaro.org>
Date: Tue, 01 Aug 2023 10:41:14 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.2
Cc: rafal@milecki.pl, linux-kernel-mentees@lists.linuxfoundation.org
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


On Sun, 30 Jul 2023 15:39:15 -0700, Atul Raut wrote:
> We are moving toward replacing zero-length arrays with C99 flexible-array
> members since they are deprecated. Therefore, the new DECLARE_FLEX_ARRAY()
> helper macro should be used to replace the zero-length array declaration.
> 
> This fixes warnings such as:
> ./drivers/nvmem/u-boot-env.c:50:9-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> [...]

Applied, thanks!

[1/1] nvmem: u-boot-env:: Replace zero-length array with DECLARE_FLEX_ARRAY() helper
      commit: 3c74e2b14ff03aa9434a91809ad9d354181f43ca

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
