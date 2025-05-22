Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B951E3CF58
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 16:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747930875; cv=none; b=lLrehErWLtHi39WZy31wGaRB1nD6RLpv4vdMglBdO6PaA8k4YulzoZrWRhXbDAbc6Y8a3CdfcVg/EbcSvcIzoX07P7SieFohcQrbJVc0M48znXfKp41Hh8eagYa+ygttszs5ob1fSXvQlGuEXF0/HEPvKNS2iBMsYt6P3lCWaWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747930875; c=relaxed/simple;
	bh=rrLDAIKiEK4nCi+9i4gqRmBlWWl8TS9ByU/6a1reG7A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=d0SX3JWUFO5eRLigEAywJh0Rgqfg0F1z8tWbcBX2VplMwL0Ivaq5/q0g+GVWCbuLD4HzqUfNxrj8yp5vFp/TqlsGCLLWQnLkms99RS1/gqrg1lTo32ZFzLr8CwqTta4dmAI8c6WWp8onIiryBM89mITWxFEaJj0O7ywIJbleVWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=fail (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=ViNTx9WS reason="key not found in DNS"; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="ViNTx9WS"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3dc729471e3so15605365ab.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 09:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747930873; x=1748535673; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrLDAIKiEK4nCi+9i4gqRmBlWWl8TS9ByU/6a1reG7A=;
        b=ViNTx9WShSfxxp2eJrn5fxyYWVel8ao7/aPMwWq5nNde1IH98wguyVnWif99gRbxLL
         mcamSZUU72/+02oXYf929CLImx0jKAV4+/9ISqgtXtBE/JN84bHISkTTVZ9f9yo589ax
         ljO0qO/6YKYVxS8XkAZ9H0uZNlo/k0k/csVOGkL/WJVKzU4wzEwIvrDEQKvtIL3qEgoI
         w7/b2pmJlKv2kt5+PlrYms9LcI1J+M3yJKzfCgqbZwOqT2spsGM4yUQLO1mayrVt4ABC
         moJyBUZyATsUNUaI1GTK3jsGlR3f4ho0reMNvpxEg3damCcVjLlg0ybM3yJxShEZEOQo
         JwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747930873; x=1748535673;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rrLDAIKiEK4nCi+9i4gqRmBlWWl8TS9ByU/6a1reG7A=;
        b=dBB7wilr1BQX/eLsWscpvIHvDq2Ma7QvGt3EzzgxDWrjOXC/35MpUAbdWol4KBCXzE
         Gy3VR/x4GxkQjBC9VdNaZqKU3TTlnqeF027DqqJaioPOSDOdu2wxH9PpVZ1j2HVLX4S8
         SNtVIFK7KphL0lZqQHUM2T7zjFoFjKqMyj6KyW+YshU4yf2SWAG/XfP+JO+87rmI2Da9
         MDSZxQDaaj6O94f2F9+NR79pasES6U9li4DgSFWBWO9Jl/kkP7qDIAmn7o4g+CW06b+g
         GV2RGzl+MuqPtIseKQqTynGO+sVvwAzReoaGpADyu/qBSc5yDKD64lm8pezWjFfkMC6+
         eARQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3Y3OVpbFcjOikd5z6j40WQommsIXhQajsxk1GppA6p5uTz9RZL9DbE75Pqhza/aBDhyEYRDtUecv6iJrhkFFn81G6cg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi7z5T2yTIhwXpgICSzGLuew4Del6wZewda+JlKqOzmtzqiOiL
	4tI782Qd2nFWJVyCixOIoAeO2Exzv6H8kG4QhOLp4BXYQERnTa0n8paYeT+00Sxn3EQ=
X-Gm-Gg: ASbGncupuXb/fFr+DLWIGbvNHSJ9T6JtVv9kfdG3TZlnJV7okC1VC6O8whHR6gXkR63
	q68UIQ5+zEWQfk0dSvOojEHp5FQItPhlRvVGn1QqUp/AQJXWSe9vxOY1wky++JVRbEJZzmSz7sK
	L9nKKucKHreEmjmm+Uu/H9wOv91KUWD8mawS+8x8rlfANeXk8dO6jBdKF5Q5CJIp+kOM7PiEQNH
	bUZiu9vptCZiWfDKiQD4FS+tMWBgAmYy5ylopYXtTRQBFVPGeYjXbSjfdN0lZieSXp3X9HWIAtI
	pEAGau+GmGBMF6xoUxkNAAa2mhWUjmckp4DrgE1WReL0p+Gx
X-Google-Smtp-Source: AGHT+IHOQ0SWVebfgDZDKmRx+6jWi05MfuX7gwZSb++7o+5qstcoX0pcP1SvRwbgMuT4PSBEfZtP+A==
X-Received: by 2002:a05:6e02:743:b0:3dc:8c4e:2b8b with SMTP id e9e14a558f8ab-3dc8c4e2c10mr39021205ab.8.1747930872568;
        Thu, 22 May 2025 09:21:12 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc89bfeee0sm6988515ab.70.2025.05.22.09.21.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 09:21:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 10:21:10 -0600
Message-Id: <DA2TS4HXZHLK.1WH4DSREYSAP4@brighamcampbell.com>
Subject: Re: [PATCH 1/1] usb: typec: tipd: fix typo in
 TPS_STATUS_HIGH_VOLAGE_WARNING macro
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: "Jihed Chaibi" <jihed.chaibi.dev@gmail.com>,
 <heikki.krogerus@linux.intel.com>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>,
 <skhan@linuxfoundation.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521214851.386796-1-jihed.chaibi.dev@gmail.com>
 <DA2IV4ZGT2M8.3QXO3L57VXSA5@brighamcampbell.com>
 <2025052234-brewing-recall-a7ed@gregkh>
In-Reply-To: <2025052234-brewing-recall-a7ed@gregkh>

On Thu May 22, 2025 at 2:30 AM MDT, Greg KH wrote:
>
> Too many characters for that sha1 value :)

I heard recently about concerns regarding the collision of 12-character
sha1 abbreviations [1] and had assumed that using 16 characters is
acceptable. Regrettably, I neglected to read Linus's response to the
email which rose those concerns. After reading his response, I'm
satisfied knowing that there is still very little risk of a collision
between the abbreviations of commit objects specifically.

I'll modify my git config to use 12 character abbrevs.

Thanks,
Brigham

[1]: https://lore.kernel.org/lkml/cover.1733421037.git.geert+renesas@glider=
.be/

