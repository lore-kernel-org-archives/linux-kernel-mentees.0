Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C945CE95A66
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Oct 2023 16:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C3DC61062;
	Sat,  7 Oct 2023 16:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C3DC61062
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YELg0aoU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eOSGvpKU1VOS; Sat,  7 Oct 2023 16:13:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0FBF96105F;
	Sat,  7 Oct 2023 16:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FBF96105F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8C66C0071;
	Sat,  7 Oct 2023 16:13:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B8CEC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 16:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5068282E29
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 16:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5068282E29
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YELg0aoU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id thm08deMw3gm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 16:13:56 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28EC382E19
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 16:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28EC382E19
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1c888b3a25aso19215865ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Oct 2023 09:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696695235; x=1697300035;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xkfU4bzU52zK6sm4tXBNFHasLcdSkI9FGxbIUj7r4CQ=;
 b=YELg0aoUC5lAHSpVok7zEAcXrt9ZuENFpwpC/PsZ4vWSQDmgvF0jK7HPAEZB1H7IB1
 liHt7nlk2/EV93V0nLWK/IBdc2qd6CpfbAdbbwMH2wM7mMgIXOh8Fn1BdXfzGnkwHaHc
 D+zdxmqE9nVSIKLYLjgftdZvebYlA1Tw6HogZ2a4drlPo6pVaVhLoc5iFxGb0sAw8wP4
 Oz9lOomjqqrYEp8y3qcabVrFuhwPVz9l2kr0sYnef6v3fQOOufm9eHl3Lg+yN+kRt/ay
 WNomBcF/zbqOV/exFtCxeTPGla4x86YuCaFil7VSvkcql74z2vuzUXT9ZwnMQW3pbl5M
 us+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696695235; x=1697300035;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xkfU4bzU52zK6sm4tXBNFHasLcdSkI9FGxbIUj7r4CQ=;
 b=XhNSfbjtUKV20LDthHD7dQ9O/SXnzDX4/nD7zF3nZyIG0/fPN6LXga//t9BxYFLn8i
 NiHZlfeTxl2MwwMA9AqsPNLZN9P3KOa8vGVqIDEMoAPgjUNK8BzQdcpLTQCVSCJjLAOP
 f89oJWY4BuwNVv+vgHqT0l31OY5MInDnJ+0Mk5s84+wRkkLIfWQOhiu1D67TWgL/xZj4
 JH2B75sDRKS8k4mVBNKUOA02KS1sOcwKXhRHjM0VVsdYSGZ5xBVzpOJT/NaKrgM6KC6i
 sLTF7YUcGnfSdqDC4kKoRxTfg+UI3tacTE6MW8GJ0um25sYU8nZuSKxPBNpSo8176BM/
 1y5w==
X-Gm-Message-State: AOJu0YxLwtQ38e+DLp7qXdf/jaSj01b1Bk18hSjTyY6w5Lp5+uqH+KcU
 BYG2aVQMYX6JtRft6B3WPnI=
X-Google-Smtp-Source: AGHT+IHx7uW/3+I8klN2K9j0a2Ii8xQ7H7aYh/Wqy1ibZ2a6Vo4SN76zJlvZ3wv4/5mM5DjlT9Ez8Q==
X-Received: by 2002:a17:902:e5c7:b0:1c6:ec8:4c67 with SMTP id
 u7-20020a170902e5c700b001c60ec84c67mr11904346plf.18.1696695235460; 
 Sat, 07 Oct 2023 09:13:55 -0700 (PDT)
Received: from [10.3.171.174] ([103.4.221.252])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a170902eb5300b001c63429fa89sm6055800pli.247.2023.10.07.09.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Oct 2023 09:13:55 -0700 (PDT)
Message-ID: <2281f924-30d1-41c5-b105-d8d28aada5b2@gmail.com>
Date: Sat, 7 Oct 2023 21:43:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] input: add Adafruit Seesaw Gamepad driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org
References: <20231007144052.1535417-1-anshulusr@gmail.com>
 <20231007144052.1535417-2-anshulusr@gmail.com>
 <a49deeb6-728c-4527-8399-57c52214e1d3@linaro.org>
From: Anshul Dalal <anshulusr@gmail.com>
In-Reply-To: <a49deeb6-728c-4527-8399-57c52214e1d3@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Hello Krzysztof,
Thank you very much for the review, I am planning to address the changes
in my next patch series though I had a question.

On 10/7/23 20:26, Krzysztof Kozlowski wrote:
> On 07/10/2023 16:40, Anshul Dalal wrote:
>> +
>> +static int seesaw_probe(struct i2c_client *client)
>> +{
>> +	int err;
>> +	struct seesaw_gamepad *private;
>> +	unsigned char register_reset[] = { SEESAW_STATUS_BASE,
>> +					   SEESAW_STATUS_SWRST, 0xFF };
>> +	unsigned char get_hw_id[] = { SEESAW_STATUS_BASE, SEESAW_STATUS_HW_ID };
>> +
>> +	err = i2c_master_send(client, register_reset, sizeof(register_reset));
>> +	if (err < 0)
>> +		return err;
>> +	if (err != sizeof(register_reset))
>> +		return -EIO;
>> +	mdelay(10);
> 
> Why 10? This should be explained somehow in the code.

The reason for the delay is to ensure the register reset process is
finished before going further. The reference Arduino driver from the
manufacturer also had a delay for the same amount though my hardware
unit worked fine till 5ms delay. Is there some kernel abstraction I
could use to indicate a short delay or will the previous explanation in
a comment above the line do?

Best wishes,
Anshul
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
