Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13B13BBF2
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Jul 2025 15:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753369500; cv=none; b=YLrFs75RZrC+3qdYOexiowM7KRn+OxwMjPcEEBGD9VCWrN9hUbYS1qCFPzl6UR4Z7Kt59AQZvznAC1K32yuGNpksV6RfjMZ2Qt9Wa3TXconRYxhEpCHFpWG/Nd0cywDR/e4TOwyfYeBUP3k2y8vPesqfsg0RFKcGqnicIKiRlQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753369500; c=relaxed/simple;
	bh=ktDkf4ooHaeISTi4kJC16b6ncEGl//z4yaOeiADDyeY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=fGv86U+tFBgJw/EO06XsMFJpIC3+9vMkV1tYpk0NdM13UXs9tSbTcgmL+8m8OrXaEFk3IEzZeUk/blcJx6C6THLHKB9FXacCh7uwdJyJwaaO5CvVfCoCxNSSia9L0m/M+UBbuTGgcGeNpOi3FPT2CJ4/A6DSrBL6lCcHNF4TRfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iW5v0sNV; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iW5v0sNV"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23dea2e01e4so14221335ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Jul 2025 08:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753369498; x=1753974298; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4VJi2cu4pu/Zp2p6DZkzJlLQR50cjtH6rzu4mo7OPz4=;
        b=iW5v0sNV893XbtwxNbNjJZpLgjJo1ARau0FEQAAxYCRjasT6xxWwOwjBgI86B9RLSZ
         pjfDBMMSsotDjMFqrsWayKPyopneKsxyl2+hPQmjbDczqNq79sfmlMkF/kqKBba7ttYk
         XaAgdJSOisVYhx9BM1mjBJ0kZ+De32Efxn8IV/0geGQQJdIjQeoyxQknA8umolqL45u3
         IbkbIOHROAilGIaUYc6vWp04Asq8SRKf9y8lBCY8ESmdkWmimuNKXLBhNQfDY1ZRPhOv
         j2LetRr95l+yoS859APoKfpYbXe90V1MStO4P+oJB7ROjswZwUObMGvekzmneG2yxKV5
         eZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753369498; x=1753974298;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4VJi2cu4pu/Zp2p6DZkzJlLQR50cjtH6rzu4mo7OPz4=;
        b=JY6sA8SjyBN9R5db3rfCatPO5AkWfM0ns4XU/BIeNsE44eSacTE3QIA/KOcia9CgRg
         nb4FmTq/SjlqytbKCkkxKTathtgLA3RUlRDJANZIebM+ZhmaNAjW1W+3CoE7dZ6p43Gq
         DvM5lggIXC89qo3LK3EiBuV0zkoqAMZJc6CeTwDv2QtQjT51WBvelIgNcREadUkadW/X
         FNh/2brrHsQcRBp+Faap5kJTils69jVoB/UJddCV73TEpw1jH+xyA+6GsvG+CoSPOAG6
         ELBpDLNcKuWRZ5woE8FYwwz0OhcTpSzFwbxsgHo3Br/k7r078EPICFRyXxIyiWIkzPOz
         3rgg==
X-Forwarded-Encrypted: i=1; AJvYcCU+CJLdTLy9lBYpfRhoYvPBxVcSxvtrbyz52FNPwuTpoQ4PABAUimXN130JTobti7PaPIV7QjguIQHwy9tu+rMePwDG4g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfpGmonGRcXzAQ4tOjL4MDBKvG8Hzoc8V7BTn1LXDrejeyVvyt
	nKmNMVNJj20NUVSHOO3ZlO8MwIG+R46bgQ4Zbbrf1Lsjx5IVfct9ZMQO
X-Gm-Gg: ASbGncsyFW+3W6O9aY4PAki/Ngv00WO1GAAz0u+WPX+8lgcTM4aF9wavw2YtYhkWCsX
	ClZgWseYakcwm9aOeWw2d0JCLbJCXPKTv8RsrkNIdVakMZTcD4BWMjUAJPqF5hwCsNI5eXiiPuu
	Cg5y4bKaI1zH7DmSO+RvRreyJcoT8wFAh2rC3NFr04dZxc8A2d3BembVWn2AU2YuOVRHcvbrbZn
	wzhiWeB/f3ibM1DSzvVu/0F+4xyWjbcy6vxD6DjPBiAsVxilUtheY0WVfC71EhzWdx4SLufPYgH
	Wmi4l2HVr8tqFmL/w6nmafTVgfAo7vfUqdz5lP1VFCvY+li1gw9FP8GaeX2IxNzOpFNuSCq/zFm
	iWt/KeLbMkr0voZuir/qM/ysMls0zzLIPaN+l612x/Q+b9N3K0Hfpq2ZCGLF+oGs5EF2w
X-Google-Smtp-Source: AGHT+IH9cx1cvRD3IQY4uOu1d+OFFXg/UeSuSp7C6i2Hu8/kishvHcv8Nd2SqaZW2O0pJXbOH+sNHw==
X-Received: by 2002:a17:903:46c4:b0:234:d292:be95 with SMTP id d9443c01a7336-23f981b6379mr104279395ad.42.1753369498157;
        Thu, 24 Jul 2025 08:04:58 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc73dsm17772735ad.89.2025.07.24.08.04.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 08:04:57 -0700 (PDT)
Message-ID: <8a88e6e7-c1f8-4ec7-87d4-c64714085a69@gmail.com>
Date: Fri, 25 Jul 2025 00:04:54 +0900
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: hendrik.hamerlinck@hammernet.be
Cc: apw@canonical.com, corbet@lwn.net, dwaipayanray1@gmail.com,
 joe@perches.com, linux-doc@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 lukas.bulwahn@gmail.com, skhan@linuxfoundation.org, workflows@vger.kernel.org
References: <20250724072032.118554-1-hendrik.hamerlinck@hammernet.be>
Subject: Re: [PATCH] checkpatch: validate commit tag ordering
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20250724072032.118554-1-hendrik.hamerlinck@hammernet.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

On Thu, 24 Jul 2025 09:20:32 +0200, Hendrik Hamerlinck wrote:
> Modified the checkpatch script to ensure that commit tags (e.g.,
> Signed-off-by, Reviewed-by, Acked-by, Tested-by, etc.) appear in the
> correct order according to kernel conventions [1].
> 
> checkpatch.pl will now emit a BAD_TAG_ORDER warning when tags are out of
> the expected sequence. Multiple tags of the same type are allowed, but
> they must also follow the order. 'Link:' tags in the changelog are still
> allowed before the tag sequence begins, but once the sequence has started,
> any 'Link:' tags must follow the ordered commit tags. 
> 
> Link: https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#ordering-of-commit-tags # [1]
>

So, you are citing ordering rules specific to the "tip" tree.

I don't think there is any wider consensus with regard to such strict
rules.

I have to say that your change will make a lot of unneeded noise for
most contributors.

If such warnings are only shown when the user opted in to the tip rule,
say, by using a "--tip" flag or something, they might be helpful.

BR, Akira

> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> ---
>  Documentation/dev-tools/checkpatch.rst |  6 ++++
>  scripts/checkpatch.pl                  | 40 ++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
[...]

