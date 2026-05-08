Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5FA32720D
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  8 May 2026 16:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778257646; cv=none; b=NMV3IqY8rre3nFUAxnJzrzE/0FRRiMpwx1Fp/S4EJCZbN069TQo7uas9mbETygq6r9Ll5ikr6zyl72AphvTqEJDjLWozvAc7ykJzq0u0ZXh6Y3hoeJbkZE5/UeHbfv4A/p3BDt3JjcBl7oZLo9smi5GU78tSGqCShk7844OwEFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778257646; c=relaxed/simple;
	bh=6KxY9Roi8N8d4WWwIr2x6TbvGnckQnG05iuZrFnZ2Gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PG38ZnxmyOlATQ+Iy+shfFJdWjebDFoqQ/ZuPdbFZyA5D89Ov6iQsISAd+LQ9ZUyccwo82TvAOIG86LH7FfonnB0hY6tt4RCifTGnccpRl5JiaSVw/3QQIWCradrsHHf3c2EAmn7+w345Z2pUh24lsg1f5xaFV4FRZMknNEbhGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcyIaudg; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcyIaudg"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-364f7c42c62so1985247a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 08 May 2026 09:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778257644; x=1778862444; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3S7UqGfQlbSNMAblK1AF7WjzWItdK4mDnUlHoxWt7Tk=;
        b=WcyIaudg81tB7Ndj+sw+6sYd/VaO/oyDoNcs4siZpdG5H9cNkDussKWoiGjNSESClo
         vVvY9yxhkBsyhYCBK7or8vDbYccXyVUSOuy443eOP5mVXnsVrYIf1YIAR1YKO96soJsA
         vYPrlLD7DfJai+4XQjSsKKMDS/Cn44zhTyLfEicUaj1z3idyg+V1kv6Wtz+8C8liEUXJ
         HZRsMcBqCwWWHlYC3KO/dlZP8Fr4kL9VUexNXEvA+JkSpf+ayByud6ZAqD0SQvje3Tyu
         udYULwyuvBEcxEo6g+LqqTbu45KTIOzcA8bEDmbNghSnmUkN4l+A2Ycrq+zVeKGS4iRk
         uVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778257644; x=1778862444;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3S7UqGfQlbSNMAblK1AF7WjzWItdK4mDnUlHoxWt7Tk=;
        b=MKKLttqDD4TQGbXrzByrotlEmQDyKTp9mODJjEHyY1YM7F6ONiwbJGDnvyFlrTt18I
         JgWKs4EcZUaNct4Da2F/gvv13acR/+njU6jLYRRmpiNue6oNnEb1Kl67H2ZmumfYvub6
         kZjVFCWG2yg3MfhxKzkhlroCys48R4InfICBNb0VL4tv+/rWVQe04ExTS8Fs8GOjPVdc
         SCkdCv0pfP/1JOA9D0Fu8b1gXfBf2PHTZjtr9ZMhoTCp6s8lHjr5cjO9YPKDIgWG0i4f
         XNn0zXgz/qOd9mCL8wsiClDcjPuDkd7tuIhUTR/20n+QEwZIah+z5DgTjQ5Ur16S/HQ5
         LZvg==
X-Forwarded-Encrypted: i=1; AFNElJ9j+v+f8I+VatO/uHTq+docnoAfAlXcLc/ObqbiSgE6mjtTvfyjUCDFIdidTt9lERNVVctLADg5/U50p3A3yoEP1sk0KQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgbOyxTd3zMl3b10uKcux4F7VxnRdWouih5rcCTqfeRsTpy/St
	35D2Dz+IxdVFt5801zytNeYCmkNo870/NL2OdCB7tatcJNlf9aMfvojC
X-Gm-Gg: Acq92OFifP79zMhtwSLCwlgaWBN7DZ0mOnECrh+DcScW61k+1/CcAdcKSvqLAo5qX/A
	Mq1BNb5xQ0BefyZcXaGjqB54YYEVowZqXT/a8OFAT6LO7Y9oSTnvLJUnYv2F9WyDeVb/yLWnQL8
	5duKeocuXBVabMmmNP1Y7CxwSpqDwAa1k7vge0jhjMiKWLGJlcvFhfh2tSUqpOxE21VnLydKOhm
	mYMPT9KqByKzaSIROa9peZjO7ocX4gYaundmvqIZT+tLV6k0GRgv9AV4TKyywWIovUVQNORjyd6
	5vDeVWeEqDXpEYK9nlZp75OG0RayNHz3y6kYCUccbZrKLNoqyOnMvTEs3RBduJ16YElTwKDBCIf
	BXXX4IsdW96n57M7zvlON76B8+2FcDljZEb4XRHfVBDLooTfhiuF4xEy+F/RJp3AMlUN2ZcPgbq
	VAl5NbJVmOS30IJtYDSQ+bDcfI9ws07cohnxXDW1AxV5sY8MqqzWUTqLsnvhwxTml1bn7kW2T/
X-Received: by 2002:a17:903:1a24:b0:2b4:63bf:5535 with SMTP id d9443c01a7336-2ba79be13f6mr131726645ad.41.1778257644123;
        Fri, 08 May 2026 09:27:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ead90asm25973485ad.72.2026.05.08.09.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 09:27:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b6ed50e1-c095-4400-b538-b51ea7b26e0b@roeck-us.net>
Date: Fri, 8 May 2026 09:27:22 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] hwmon: lm93: clean up coding style issues
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, me@brighamcampbell.com,
 linux-kernel-mentees@lists.linux.dev
References: <20260507101143.559475-1-ninadnaik07@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260507101143.559475-1-ninadnaik07@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/26 03:11, Ninad Naik wrote:
> This patch series includes code style changes for lm93 driver to fix
> several checkpatch.pl warnings. No functional changes are made. I tested
> the changes by compiling the file.
> 
> Changes include:
> - Add blank lines after variable declarations
> - Change 'unsigned' to 'unsigned int'
> - Remove else blocks after break or return statements
> 
> Ninad Naik (3):
>    hwmon: lm93: Add missing blank lines after declarations
>    hwmon: lm93: Change unsigned to unsigned int for clarity
>    hwmon: lm93: Remove else blocks after break or return for consistency
> 
>   drivers/hwmon/lm93.c | 87 ++++++++++++++++++++++++++++----------------
>   1 file changed, 56 insertions(+), 31 deletions(-)
> 

Please refrain from submitting such cleanups into the hwnon subsystem.
As you can see from Sashiko's feedback, the driver has functional problems.
On top of that, it uses a deprecated API.

Fixing actual bugs and backporting them is only made more difficult by
cosmetic changes. I don't mind if cosmetic changes are made as part of
a functional series, in this case for example when porting the driver
to use the with_info hwmon API. On their own they have no value.

Thanks,
Guenter

