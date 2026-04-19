Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3C73126A0
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 19 Apr 2026 22:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776637490; cv=none; b=hF87jlqHUSTWix3VKK/bYqvD91fJYRuwVoJXdctFFvGxThKDh/4C08xApkToyXNTD1nPqZ489SEronOMmqSWtXjmC89tTwVIEcSZ00r1QG9KtI2x+ThibMbCobLiLwE8PWiFyiA9JUS3FmU3QRYOfNenWiFXvIigN5jHD6Vn1rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776637490; c=relaxed/simple;
	bh=1r9FDFxtZWFXvFUP2I3cbR+qqs6c7Mcq/LA+asXQk/o=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=UxvMQ4FFglkLDoILzXJRoVnVTpPugs42v0wYhbmKKJKbfDXONys1NyeGaA0SyuYq8UBW3RyQK7SoqPIdrAWKl2zP79i0Yt0dcBK8hQYKs3UCCezTaLkr8g8tNQnM3j0A9JWrM9GYxr/BQ7u+4wEHmRocawO0jYqv9oMb5cbH/Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYMFnMiV; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYMFnMiV"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so2224098eec.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 19 Apr 2026 15:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776637488; x=1777242288; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s5+BOCkksxieckItdNV9E7HptDSZAKtPJOnGq6abAng=;
        b=KYMFnMiVyms9dzDSYpseO21plutt7LgH2iJ0eHxk1saVl55yeNuoz+yP8YjL3GBG3K
         xBOzzPSBEod3WgphGxImLyqAhynrN8XaluuMLpZelQlMLrPZcMfvpoWX1rSE1JiXiw1U
         AbZd8MQ00kuWN52j5VUC3E5bjk4FKVovq1ysNuYJzPnI9YD6SwIs2ZgwN2iJm/mjRxKZ
         7hKlNxeAb8vfZZpSYlRq9JpVXyIaEo8F3TqqpYaGykvOjr+Kw5aTbO7G6XAFwfYmO/o8
         KMQsrxM/0iDFBrhQFc7rSdHwf+oYp+Tjvx8IB4/HTBv769htRfRTar56G82fOL0Ef3O6
         jhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776637488; x=1777242288;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s5+BOCkksxieckItdNV9E7HptDSZAKtPJOnGq6abAng=;
        b=GCMjzB4osqNSt3xCYYQah97qsRcpRZ43p5kS+mVblD14yLVH0/rc9QmQvmhSJ8w3Gp
         hemEYOUmc3hDRCcF+tMK+67Ty1NgPHG1JCFeSi6pD44HY47eaf/HUNNK0jlZjyEzlXYx
         mipjfUJyrAATl5wQk5FjLl5zz5Wet8MU4LYthBHX45hqXSEeX6/ze1CXQyc6zA5Gsjh/
         SQbEA6FEKhA7cYpAR6YvFFKZJdos4W817SQBixaedAR4F6J1a6D7XcRzkqGc162A7/kr
         CIDdYPsv4kLyBnuMN1sArgF+bp6R8u34plFBBRY+WcJGiP0nUosPunbeEnRdJjNYpK8P
         UNng==
X-Forwarded-Encrypted: i=1; AFNElJ8Y/2Ol4F/dH+ivkZOEBskTDi524L/uWi4BVoWLljdMaREH1yinGBRVm1KJpxfazw/eBdwu/veFZjq24UjpzlYfURG0Cg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYjLQHgmuHK0LoP367U6g8EYbw1LguOVaBNP3MgtdC4XNx/bDM
	7KHtcMtifj0G0HYN8pEhocG4bXGWjjVdzvEjKZJ61kru61fwLXKWo9+b
X-Gm-Gg: AeBDieuFtAGrL4xwfu7E75CLex5KfGEmUQ3SkfWVJgT0Dc3bEHD48OcA919SftslNzM
	TBAKCY4kExqEQrmDmzjJ1gQSxXwDMwh9OmCnKuQVMU1iZp+feRe8Qg7lXOo21hypvEPcuSVSKtN
	d8dfi4nTt1iR94z1u+Q86V+h/mcpDOJXfBSKHD+timJoL+SlSEUPX77yHj6knF3PYR6m7wpcXE8
	uCFAKjOBtim9/x3HcVoZsU7xaAwv5yrAOZuCjY+SaCwDHWOKcNR5s/sLannOnSr01qVQFo3b4V8
	LKHjoj4nqmdJvxWgA03kYl2kDyMAPmapn8XnMIlY9kzJwQq+MpSlfqHeGW5Tr3gXJkXex42Md+r
	1I1LELXU+7dOMbZG4BWkb1Lvcp6SIE12rYn2e7TMLkDC/TSHBFDZZjvF2DEPZw0Oi0ENlt5mMry
	RpXw+Obg7vmgPh92uYyzSchmtiv0IodxlPMa9I5mIIBHWEFPEQuU969SHrgAQk+4fuuRNZ2bezY
	Kjwi/ZOF0FdAQ+tujpz3AP8Q1KYG6Jm
X-Received: by 2002:a05:7301:168a:b0:2d1:815f:19c1 with SMTP id 5a478bee46e88-2e479c0427dmr4896278eec.15.1776637488176;
        Sun, 19 Apr 2026 15:24:48 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa6134sm11902032eec.3.2026.04.19.15.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2026 15:24:47 -0700 (PDT)
Date: Sun, 19 Apr 2026 15:24:46 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, Ninad Naik <ninadnaik07@gmail.com>,
 Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 skhan@linuxfoundation.org
CC: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 me@brighamcampbell.com, linux-kernel-mentees@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_Documentation=3A_fix_spel?=
 =?US-ASCII?Q?ling_mistake_=22Minumum=22_-=3E_=22Minimum=22?=
User-Agent: Thunderbird for Android
In-Reply-To: <b94cef14-d02d-4544-abb5-ead7db6eaa72@app.fastmail.com>
References: <20260419170835.347910-1-ninadnaik07@gmail.com> <b94cef14-d02d-4544-abb5-ead7db6eaa72@app.fastmail.com>
Message-ID: <BAA4F3A7-E892-4904-95A6-64B177CDA7AD@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 19, 2026 3:10:08 PM PDT, Mark Pearson <mpearson-lenovo@squebb=2Eca=
> wrote:
>
>
>On Sun, Apr 19, 2026, at 1:08 PM, Ninad Naik wrote:
>> There is a spelling mistake in Documentation/wmi/devices/lenovo-wmi-oth=
er=2Erst=2E
>> Fixing it=2E
>>
>> Signed-off-by: Ninad Naik <ninadnaik07@gmail=2Ecom>
>> ---
>>  Documentation/wmi/devices/lenovo-wmi-other=2Erst | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/wmi/devices/lenovo-wmi-other=2Erst=20
>> b/Documentation/wmi/devices/lenovo-wmi-other=2Erst
>> index 01d471156738=2E=2E1d0410500d3f 100644
>> --- a/Documentation/wmi/devices/lenovo-wmi-other=2Erst
>> +++ b/Documentation/wmi/devices/lenovo-wmi-other=2Erst
>> @@ -144,5 +144,5 @@ data using the `bmfdec=20
>> <https://github=2Ecom/pali/bmfdec>`_ utility:
>>      [WmiDataId(1), read, Description("Mode=2E")] uint32 NumOfFans;
>>      [WmiDataId(2), read, Description("Fan ID=2E"),=20
>> WmiSizeIs("NumOfFans")] uint32 FanId[];
>>      [WmiDataId(3), read, Description("Maximum Fan Speed=2E"),=20
>> WmiSizeIs("NumOfFans")] uint32 FanMaxSpeed[];
>> -    [WmiDataId(4), read, Description("Minumum Fan Speed=2E"),=20
>> WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
>> +    [WmiDataId(4), read, Description("Minimum Fan Speed=2E"),=20
>> WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
>>    };
>> --=20
>> 2=2E53=2E0
>Looks good=2E
>Reviewed-by: Mark Pearson <mpearson-lenovo@squebb=2Eca>

Hi gents,

The MOF spelling mistakes are well known=2E We've left them is as to ensur=
e match with what the hardware actually reports=2E

See: https://lore=2Ekernel=2Eorg/platform-driver-x86/cfd7977e-d612-4e08-a6=
8a-65fed8e164b6@gmx=2Ede

I suppose if we're going to continue getting these types or PR I should ad=
d a note to the documentation=2E I'll add that soon=2E

Thanks,
Derek

