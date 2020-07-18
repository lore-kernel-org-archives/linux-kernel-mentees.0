Return-Path: <SRS0=awrY=A5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F969C433E8
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 18 Jul 2020 20:04:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 376432076A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 18 Jul 2020 20:04:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rupq1Mcd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 376432076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 155AD87FB5;
	Sat, 18 Jul 2020 20:04:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id djsK9yHTRDj7; Sat, 18 Jul 2020 20:04:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DDEE887F52;
	Sat, 18 Jul 2020 20:04:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C10EDC0865;
	Sat, 18 Jul 2020 20:04:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0140FC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jul 2020 20:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DA841875BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jul 2020 20:04:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z9LQ+N3CU6dg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jul 2020 20:04:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CEA5F875B7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jul 2020 20:04:45 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j4so14253835wrp.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jul 2020 13:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=6iOmVRoMVbU4qIjJZMlbcTETVfsHT39IuIHdkQtrsZM=;
 b=rupq1Mcd02Am9QpslDBvv9BvBLAWI3XaIjp8CXahnwPEU4u2vDw1NdsSCFqRtnC/q2
 kEhbrawoocZE14sCY1S722viEoU365QLzhvMMQj8Mr/4Z7dr9XTmte16uuPPOfXioT2D
 ouUVKomLIghO4nc+7Q9yJ22x96rIgkfcKmdZQxREZc1gy+S00KNb9LqOAGGB5Qbb/mK9
 0PCVoBquQwzDCGx/6DAxrxLua/XSwJ4I8saRwsPA+ejk7fWD2QDRSIwpKTz55fjzroaN
 qR/1QxvPcBurfddRlqhxJgpkSCMyrDQkPNmLuWIdSt9MZIr8D4WqyzHjA62etaQHTHEN
 jfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=6iOmVRoMVbU4qIjJZMlbcTETVfsHT39IuIHdkQtrsZM=;
 b=l4VujfjCbkKHEeeO8lXJsM91EI4NCh0FnlR/zxa7//Zgz8Q3PzHherl9OnZ238H/rY
 o07eymKneNHMhNJrZBcfGm2SXiN+EaKB+8uIIO0jXydTKHPCTH+mY5LBAiW3rNUndkL2
 5GX5vX41Y/EInQPRmt3NQIbFC95soH33mvXfY8gXHTDLzNcne5e3bHpQcbSM3ufhWf2F
 deZrkpmi683JzM32lA/CVqkLZKUgirKGdnreIc/wv1H+DVQ1NlB6syIYG7DAiWhTf4Vb
 jCYUqwowNP07bYvVHUlBxyLYi00z0Gi2V3Bg9V0j4NfDhOX5NHCxQZJ6OPuRSEoKrjEY
 2FrQ==
X-Gm-Message-State: AOAM533MM9l9wA1rFpQIZ/cHOL3jFoC5N6/rzs4N4FaVnhGj5ykRLOSB
 24hoeqHySHcW5MglUuEpZdw=
X-Google-Smtp-Source: ABdhPJyIPgcYzZrlIDWvCmxIBQ+wXZNKSfXDuNrUb2LIjS1hZaqXB6MrhLcULcS0HRe7RH5epxWP5w==
X-Received: by 2002:adf:e6ce:: with SMTP id y14mr15559924wrm.401.1595102683993; 
 Sat, 18 Jul 2020 13:04:43 -0700 (PDT)
Received: from net.saheed (540018D7.dsl.pool.telekom.hu. [84.0.24.215])
 by smtp.gmail.com with ESMTPSA id o7sm8289049wrv.50.2020.07.18.13.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jul 2020 13:04:43 -0700 (PDT)
To: Jean Delvare <jdelvare@suse.de>
References: <20200713122247.10985-1-refactormyself@gmail.com>
 <20200713122247.10985-15-refactormyself@gmail.com>
 <20200717165820.6b5318ad@endymion>
From: Saheed Bolarinwa <refactormyself@gmail.com>
Message-ID: <44eecce1-7c2d-32c8-865e-e80aa6c3a891@gmail.com>
Date: Sat, 18 Jul 2020 21:05:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200717165820.6b5318ad@endymion>
Content-Language: en-US
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, helgaas@kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH 14/35] i2c/busses: Change
	PCIBIOS_SUCCESSFUL to 0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


On 7/17/20 4:58 PM, Jean Delvare wrote:

> Which PCI specification are you talking about here. In my "PCI Local
> Bus Revision 2.3" specification (March 29, 2002), chapter 2 is about
> Signal Definition and has nothing to do with the BIOS.
http://read.pudn.com/downloads211/doc/comm/994029/pcifw_r3_0_updated.pdf
>> Change all PCIBIOS_SUCCESSFUL to 0
>>
>> Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
>> ---
>>   drivers/i2c/busses/i2c-ali15x3.c |  4 ++--
>>   drivers/i2c/busses/i2c-nforce2.c |  2 +-
>>   drivers/i2c/busses/i2c-sis5595.c | 10 +++++-----
>>   3 files changed, 8 insertions(+), 8 deletions(-)
> Hmmm. That seems to be a lot of changes to solve an essentially
> theoretical problem (if a problem at all). I am not familiar enough
> with the PCI subsystem to claim that it is fundamentally wrong, but
> enough to say I'm skeptical.
>
> PCI is a cross-architecture standard, and we can't possibly have the
> return value of core functions such as pci_write_config_word follow
> different conventions depending on the architecture, can we? Does
> pci_write_config_word() currently return PCIBIOS_SUCCESSFUL on success
> on x86 and 0 on success on other architectures? What about errors, do
> we return positive, "PCIBIOS-specific" error codes on x86 and negative,
> unix-like error codes on other architectures?

Unfortunately, the cover letter did not go through. I have resent it now:

https://lore.kernel.org/linux-i2c/20200718184558.110942-1-refactormyself@gmail.com/T/#u

Here is a discussion thread on it:

https://lore.kernel.org/linux-pci/fb40545a8de8df8914df40d7d6167752c5244ce6.camel@kernel.crashing.org/T/#t

>> diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
>> index 02185a1cfa77..359ee3e0864a 100644
>> --- a/drivers/i2c/busses/i2c-ali15x3.c
>> +++ b/drivers/i2c/busses/i2c-ali15x3.c
>> @@ -167,11 +167,11 @@ static int ali15x3_setup(struct pci_dev *ALI15X3_dev)
>>   	if(force_addr) {
>>   		dev_info(&ALI15X3_dev->dev, "forcing ISA address 0x%04X\n",
>>   			ali15x3_smba);
>> -		if (PCIBIOS_SUCCESSFUL != pci_write_config_word(ALI15X3_dev,
>> +		if (0 != pci_write_config_word(ALI15X3_dev,
>>   								SMBBA,
>>   								ali15x3_smba))
>>   			goto error;
> This leaves the code horribly aligned.

Sorry about that, lessons learnt.

Thank you for the review.

- Saheed

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
