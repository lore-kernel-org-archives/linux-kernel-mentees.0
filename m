Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3B21C84D0
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Oct 2025 01:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759798990; cv=none; b=rgB4Bevp0k1c4DOhAxOAmWxxHa662eEcC1TdjR6qKON4reWPyk78KUXaRp3HoWM1amh229W2iXmBAbOJ4TG1yfgdNHae4m9tV4j7Q8lNoK2eQ6EUe03B4BimKfsxbuN5Cn+gPose7MPdJvh5UuRk7RdrCP+0o6l4GwEvggjJGXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759798990; c=relaxed/simple;
	bh=UzFkx3V2abUc/caTx+es4GrOpbz+tlZiDJJUXkho6gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AmRcUcvxQJNpw6mQQs3qDgkhcm4ppqZGvEJ8+Lm6jfyjkr3Nr3PpjJ/lmrW+jZOV76s87FrPcIYLLaUTlblBcrgPQoW54+9i17zfXpBQcGtttUDkNE8QeQsaLBfNsr3+Zy4OrN/tmn9VMLNkfoPH1vYCsEg9rA6Xg2/8whZO/hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTQR2oMh; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTQR2oMh"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-8eafd5a7a23so2590424241.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 06 Oct 2025 18:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759798987; x=1760403787; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8SBkp7v3+iaIFjg2UJKNokAvDTy3nHBsuuGSn7XWGZE=;
        b=gTQR2oMha3bkXprarKQewFtkcTlxuuCPlmI8uGG2eaKMST/qRG7s83ernNlvMz7cNw
         OFDxelRlUpfcSc1a4AJaR+FFhENnJsGEfHJjHiPOrbXCH+97AKSBA/dBvtyIxG5A7VRf
         TdHktd+C+Co59oKOVP2EAeQVn60SMyYjbGHgYmbSgQcfhw/aWSfH25WkZAF2sb6zRLJN
         7ZxQ7wuqOuXbm2C9jTDPkihOhOh1GaSoBS03BjED7O9Uu2mQwpLJTCELQgB2m3hsiDsS
         f5SgHwSdRh2K7TOXfNCsJGHRPG742tG6BEGDWjGlfMeUv54hSKoQPabpD2QbpmHGQ/ae
         t+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759798987; x=1760403787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8SBkp7v3+iaIFjg2UJKNokAvDTy3nHBsuuGSn7XWGZE=;
        b=R1zvZKWBW9Nh0lnvGcjdhUEzJtOy+oY4l2NPhDGMpKRa2HWOkbKsdt3BN7HgpIYGCB
         kFiSrha6ipI9Yl9+AHExdlbDLpU9IFwFneE/VLgB46QOkBavQDZhc0OMqQmnrT5h3qdI
         oK+naNr4XN2kMGf8lY8yYJLXBqcSftaUaszaiYZd+4AzdAl9ekmPIbOWdIjmEJZK65JT
         95J9BYOmgCsrZpHIph6VqyT1r7akJJT7mErVAMGyWqUjptGfYauQqyV3u/GtMDd9mSuh
         HaBp+sooREv4uax5TjjUYaS2XMi0cfRZocpnYtjfhOdT2WPpvCcVWRjLgpAn8jbFoOdu
         +b+g==
X-Forwarded-Encrypted: i=1; AJvYcCXwyG2ZJReKgxUBkAqHlps/vBPxq3nZAt29pPrO8M6MY+t3aJO5FiSNHm/g/21HDTKhysk7LzLan88x5si0h2HeEnVQaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxhpS4LVEYQd8PG1wpJzhoe3s3H+xwoeGFF5duFIpDJrBHXE2cD
	V8mhIdVKjlUL4tUVO/jdH0/JXp6ku9E4D8biKhLsdxBsUC/B78mcwz0k
X-Gm-Gg: ASbGncto1ervSaf+CfD7kRznXTrfDU3DFOzulH1XDif5KVxBWRjkHaLnBriZv1/9kpV
	wIQXLPw6KmAIzZQNnDaDq6M2uvWo241uztckmaG8H8iZjnn+A2Yn81L0mfA8BXSvNX8j9GVoiw+
	aowxVVvMfCl1XoN/j+zbmvUbFRq7hFAn5n8I7OtxRbMBR+1/H9PntnIJaLfBlpb2AMVQ6mCz0X6
	f24T+xnrdgL4Ag7enEmamCab7bFUBNtRe5Pghrl8M+TU20Rb/xDXFofB1/1m9tq5itQha1m/iQc
	iJG2o7g18Oq8CVL1/lIRVToUmppFs6rGNN5XPSPtADcnxQ0dH7LkVhyyIwiiDzjHkGcckWK+xSk
	NmCepY2TZ43F7MgEi5UHMtkrIAaR1BGgZLHiymKZokE85XiE3rpNEI3O7oD/XIx9RrJTSuwgywg
	==
X-Google-Smtp-Source: AGHT+IFKzaGjI5KF3o8XjbsbEV/y+PYj4yekSF7is/jJyVeOW5Z3tWkcMSrolqH6JqxaNt8Zy5fevw==
X-Received: by 2002:a05:6102:160a:b0:5a4:60ff:80c3 with SMTP id ada2fe7eead31-5d5d4d401aemr672803137.14.1759798986666;
        Mon, 06 Oct 2025 18:03:06 -0700 (PDT)
Received: from [192.168.1.145] ([104.203.11.126])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5d383430asm419000137.2.2025.10.06.18.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 18:03:06 -0700 (PDT)
Message-ID: <03a4cb5e-85da-44f3-8fcc-67e23920cd5a@gmail.com>
Date: Mon, 6 Oct 2025 21:03:03 -0400
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: serial: fix: space prohibited before comma separator
To: vivek yadav <vivekyadav1207731111@gmail.com>,
 Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev
References: <20251004065618.70151-1-vivekyadav1207731111@gmail.com>
 <aOOyNpNL3YCrLIgq@hovoldconsulting.com>
 <CABPSWR4W5Eyz8=NPvysT7XhFY=bjCO_WqqOOMWeZGen9e2fhqQ@mail.gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <CABPSWR4W5Eyz8=NPvysT7XhFY=bjCO_WqqOOMWeZGen9e2fhqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/6/25 13:54, vivek yadav wrote:
> Hi Johan,
> Thanks for giving time for the review of my patch.
> I understand your point and will avoid such kind of practice.
> 
> 
> ~~Vivek
> 
> On Mon, Oct 6, 2025 at 5:42 PM Johan Hovold <johan@kernel.org> wrote:
>>
>> On Sat, Oct 04, 2025 at 12:26:18PM +0530, vivekyadav1207731111@gmail.com wrote:
>>> From: Vivek Yadav <vivekyadav1207731111@gmail.com>
>>>
>>> Run `checkpatch.pl` script on path `drivers/usb/serial/*`.
>>
>> Yeah, don't do that, that is, don't run checkpatch on code that's
>> already in the tree. Use it on your on patches before submitting them to
>> catch potential issues, but always use your own judgement when
>> considering its output.
>>
>> If you just want to practise sending patches, changes like these are
>> accepted for drivers/staging for that purpose.
>>
>> Johan


Please don't top-post. please look at the following wikipedia page to
see what top-post means:

https://en.wikipedia.org/wiki/Posting_style#Interleaved_style
