Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF7D19AD5C
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Oct 2025 01:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759801332; cv=none; b=YzhfKx1X2wBQ+1scwAXB0IaMhFMURn/DczF80JXTklSK5mWFREcljzfMxmwEnkFlMlGlmAZzuALnb0+JrUwVDN9rmbBMJhLyCCea3Y1sRDFhIXrNXAmPEoFIx65sa+xSThkiyOg4WNPgo0N5QKUNCPbfTgRxWJGPrDTTRRNXWao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759801332; c=relaxed/simple;
	bh=dTonZkeP2W8xwq64wKDM7p+9fYOwb5HtyFurNb6VBkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uLWoMuUsi0WWSxRDjCYdxj61g12yIzNJI4n/OH19XC85NQgS5BAAa3JggOsfk+BKBI7MVvMw7WP/mtZFx4/k92RnXr/cGPK47+xWN/98Xp5NxszdCx1eONCKMody4zynUa6NpRyDgWLwtBxYw0WeCjiyDF8BWVYAlSYOBH2owkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhYpM0/u; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhYpM0/u"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-930989f9f81so185002241.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 06 Oct 2025 18:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759801328; x=1760406128; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dTonZkeP2W8xwq64wKDM7p+9fYOwb5HtyFurNb6VBkA=;
        b=EhYpM0/uqAXZZgueQDLbFIMlNGAg53Nwowkxvhf+8v5lKjYDXG261pUW9kkHtF3347
         EqHhE7KFsAVY1OKjUdMKtI6bnxa9eAyODoYv2vnikeSStD4f6gY4vo4coy70bvT9aqpp
         ZU1TwIL28BHsFAvor6OZUJdnrEbKVKN7cjUfdincc44jA7U/k2ilTEsU92+jWWQJ+S2F
         pCydwMtR2c7qVSzZaSZ6rxmlULP7eeWrIFpTBBXSKI1OpBAkY9aDql7OyYYyzLD4riME
         EBy/tWlKUYWi308HyQM9e9DVwGiylCba62KjS+Oo1Wt3gj2Xc9ARc2VfYkjf+QgKi/Xf
         GRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759801328; x=1760406128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dTonZkeP2W8xwq64wKDM7p+9fYOwb5HtyFurNb6VBkA=;
        b=hA/NHlOIMLnTZ69NKbUdDpFJbWLUCWojKaZGv1pYbfNXym7nJriuTMzcz9PDB6jpW7
         Fea6rwQqSn5bDm9JXRQb6QywGu98dj6mRSXK9wK0uPahbvMdvbtjPshynLjz7U8+FfLO
         RGiYqWHPSbaU8/+B0a/0o1pb64Cm/z01BHfrpyK992xtjodOS6SXBm17VrLN3/vrD57o
         wZbzHl+W0iDnuD2RF3DK8d8isWsRl/Zche7tZCAW2+p+SFz8AndjRmplRSjNh15mPVuz
         ZxDxLACTXt6+Mc6s51aoC6k6eNxJzWQdoG87IoboBcq4iOjMFtq1Jut1vNqQKHLxIXcd
         Vo8w==
X-Forwarded-Encrypted: i=1; AJvYcCWUmovsQI0gnFcVMBqf6dSJcAUB7x9RVY09gtiPf1Q0ibkTJq7LMn7+otkbxPyhrJ5PSvxErctzDKWF2OpNWext3hR3Fg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqzRW9lviClPuda1/3pUoVPq1GcFVEvsiUp8cOpnJsmeD9jeGQ
	Y3taMw1owlgss+8f73RDv/dzQBJpri4C9p6+KiTQN/vsx3CV8Y0NMHxE
X-Gm-Gg: ASbGnctVMaJhKfg4YxPmrTpBUniOC0fr/A/v8ee1g5B5Vf0tzX5I7+Hmis1860w1cf6
	cT+QPc/eSiEBkADzRT6nA/TvoI3puU8CP/Ri7pjFYTuWvSYq1ipym6QsRlDXJEpJ1wtoQ1PkVRt
	L8o/o9ghnVSfRIgt42qxjPRN0vqkUHOkgnN3cvU2x/eH25h/ien5CqHSMrSh/R9hyRMK+R2r4u7
	Q7sIoQgOeP6blk3cqszN2/DEuoIZ6pkrjXYtBnVAuf0bDd0ZwP7AGMwnDItA3UG+CrAVnHbpLSU
	zRSKE6rX8TS0hsDjm6lSZHZOH1nhK67eOCCahDVF/P9vGmYQCMeDeyjEPGVgE/Jq04klnVpAMrl
	VH64WCyY+mA1xTiEIwqhAPs+rWLJH93US7Pmsh0xfoLVptE6ijLNLbN2qzsZn3fc=
X-Google-Smtp-Source: AGHT+IG/CuZVAES3BSHynINML/GYB9ctain2pBZEnoUSZafLAz/JojezFxB/4HIhRy7e/u9iBABY0w==
X-Received: by 2002:a05:6122:3bc9:b0:54a:a874:6e4e with SMTP id 71dfb90a1353d-5524e902014mr4641182e0c.8.1759801327865;
        Mon, 06 Oct 2025 18:42:07 -0700 (PDT)
Received: from [192.168.1.145] ([104.203.11.126])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523cf64c29sm3436147e0c.20.2025.10.06.18.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 18:42:07 -0700 (PDT)
Message-ID: <8135af96-528a-4aca-8e11-7cdf038f1454@gmail.com>
Date: Mon, 6 Oct 2025 21:42:04 -0400
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: fix shift out-of-bounds in sg_build_indirect The
 num variable is set to 0. The variable num gets its value from
 scatter_elem_sz. However the minimum value of scatter_elem_sz is PAGE_SHIFT.
 So setting num to PAGE_SIZE when num < PAGE_SIZE.
To: Kshitij Paranjape <kshitijvparanjape@gmail.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Doug Gilbert <dgilbert@interlog.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 skhan@linuxfoundation.org, khalid@kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 stable@vger.kernel.org, syzbot+270f1c719ee7baab9941@syzkaller.appspotmail.com
References: <20251006174658.217497-1-kshitijvparanjape@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <20251006174658.217497-1-kshitijvparanjape@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/6/25 13:46, Kshitij Paranjape wrote:
> Cc: <stable@vger.kernel.org>
> Reported-by: syzbot+270f1c719ee7baab9941@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=270f1c719ee7baab9941
> Signed-off-by: Kshitij Paranjape <kshitijvparanjape@gmail.com>

Hey Kshitij,

the formatting didn't quite work out the way you intended. For the next
version, please try to send it to Shuah and I first.
