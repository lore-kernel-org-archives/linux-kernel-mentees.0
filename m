Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FDA13ADC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 16 Feb 2024 06:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708064380; cv=none; b=BcDJstEWmd4RktQTKbd1N79i9Uxqam9ZSjaogluT12hwrb2eXvcrurQaiwfxAPLAT/voC09oXBIt3LHMLIEahjfKslQM5ttjIXjFrD0vnoidSnkrIaHSUOu3vo1GArR0idWnDIFFNDH6hVfDT/QzOj3bR+7f1uD1waibgFiY2Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708064380; c=relaxed/simple;
	bh=twDT7pQukCriu5b7GZvI8MsCbZs40QK0iZ/i8KWlgCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lfH6XWVdzUbOpBC2XwGSMEoFMgFNzOB5ny4/xGgPVwyHMtm3he6eorpuOp+eJwJJuV+RdJsT9/wZQoJo93HO222lGFJ6ynsELWU5zoJL24EnzaakZeDM1v3xbScWM+atjuDK2f5MNOLAaMY/CC7hvCiKL6FaYi70NUZmIGyEN4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mI2Rxwzi; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mI2Rxwzi"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8988181756
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 16 Feb 2024 06:19:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O2LZp95F1duS
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 16 Feb 2024 06:19:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=lukas.bulwahn@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C5448174C
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C5448174C
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mI2Rxwzi
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9C5448174C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 16 Feb 2024 06:19:37 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-562178003a1so397385a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Feb 2024 22:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708064375; x=1708669175; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twDT7pQukCriu5b7GZvI8MsCbZs40QK0iZ/i8KWlgCI=;
        b=mI2RxwziDdGvrvRwwlQEUO733zQ/9xHTfVZD9D61c0Y7gdgqfaH606ZMFMAEmwGhmH
         +R66xMiQJnT16Oetcdqt/vTLQ8w7GDPHLW813dt3kNabfCxUP8mpxSA6KDtahoFQP/Xl
         6BzQa7mdg7Xi5ywI2F5a6VqXAcxUcQfWzYsx+z1xybcelbnx/mxEXEa9U26aag8ynJok
         0BO5uRfI4QNbT0rIxQvfWWqvwrzx1S3r3+hTFgNK+F4kVtIbQBJGHdcFh2HfgzVwNS2W
         MoRvqtvZtdCAIaJKZWbVEKDu7jrIe0+LiERdVrTJK4+PKwxG9mlumKn4EMgorOH4fI6n
         gTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708064375; x=1708669175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twDT7pQukCriu5b7GZvI8MsCbZs40QK0iZ/i8KWlgCI=;
        b=uiAmSdIyc6bfF7Z9TF3LARGZ6FTXC5CG9NB1/MNjHfr+zzQ6KohS/8G50CN9Y8Anm8
         QKbzEIGHeH8kxyS9d/IsB8TKgEnnd3COpPqH7exE+csVNynHVQOmiTMkTuXRESnyVRUz
         iDGTV3C1uF8DedYc+1XB5GzhUSqK94eONPo1jB5ufAbPcxVFVNZXS8A6sSc8388HL7Hr
         eHHdePzi/45BSsIhxtQ4S8XmEZ5vw88BIcD/UBbtCDE8Gq5KRnVSD9bdBpWL4Owsc6xF
         g2UbRAf0njkkjoBV6iQM85PlEq6bFlArfaK/Emxkx4RtQb8fSAw3RAPxJGn95tnZzOCG
         s2Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXwfQXtFrz392eDkb+Cmmq2nr9pwwpct5kpL9OuCf9RlmxYXf9Tbn/cXF//dJTfJSfdeRad2U1CqenFZ0l2fUOjPTre3uctjtcIwObdjjG4rP5WY9Ai1cJD8jpI/9B+
X-Gm-Message-State: AOJu0YwfQex2DYXJ7FBXkhHN8jf8abNi9R7RNR0L6OjPoUe21qOgEk18
	yzbnGh1IQBImBLkcMe9Ra/d/EqvoS39Flx5uv4G/ragSJWddYELPwfk4NPf5P78sSg9m8dX2DIB
	ZtBCjHX8qDPUFS0OBpROttzZQiq8=
X-Google-Smtp-Source: AGHT+IG3UH321Wj+62YjK+x82KH4WpkZBya/9VqrCbb8iOi2xWuIQnhYdvT8EKc9ZPnqf6YyWJaQstUaRwJ/OfHfStI=
X-Received: by 2002:a17:906:8404:b0:a3c:f7c9:5ba with SMTP id
 n4-20020a170906840400b00a3cf7c905bamr2441015ejx.10.1708064375165; Thu, 15 Feb
 2024 22:19:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <piosq44nxwlfeutperrk6d23bx564qlbfirc5xlbouyrunf24r@u6qsgqp47fz6> <tencent_B08771190400813E0CC41E36A3F540AACA07@qq.com>
In-Reply-To: <tencent_B08771190400813E0CC41E36A3F540AACA07@qq.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 16 Feb 2024 07:19:23 +0100
Message-ID: <CAKXUXMy8WZwAqrARe-6nNhtvjSiosDD3X5aPZPfn7GXtkG8B8w@mail.gmail.com>
Subject: Re: [PATCH] Fixed case issue with 'fault-injection' in documentation
To: "Ran.Park" <ranpark@foxmail.com>
Cc: ricardo@marliere.net, akinobu.mita@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 6:29=E2=80=AFAM Ran.Park <ranpark@foxmail.com> wrot=
e:
>
> Thank you for your reply. I'm sorry that I noticed this problem
> while browsing the document. I have not seen any report about this proble=
m
> on lore.kernel.org or other places. Should I mention the situation elsewh=
ere
> and then resend the patch to mention and fix the problem.
>

Ran, in the future: please do not remove the context when you reply to
somebody's email.

In this case, I wanted to help you to understand what Ricardo was
asking, but his original response was not in your email. So, I copy
and pasted it now---but that is not how it is supposed to be for
someone replying to your email.

On Wed, Feb 14, 2024 at 2:21=E2=80=AFPM Ricardo B. Marliere
<ricardo@marliere.net> wrote:
>
> Hi Ran,
>
> On 14 Feb 19:40, Ran.Park wrote:
> > In the 'fault-injection' subdirectory, the first letter F
> > is capitalized, whereas in index.rst f is lowercase, but in
> > index.rst all other elements in the same column are capitalized.
>
> Does this fix any error or build warning? If so, it should be mentioned.
>

Ricardo suggests that:

- you run 'make htmldocs' before applying the patch and check for the
existing warnings.

- you run 'make cleandocs' and 'make htmldocs' after applying the
patch and check for the existing warnings.

Did any warning disappear or appear due to your patch? Were you
motivated by a specific warning you observed during the build and you
addressing that?

So, for starters: did you already try 'make htmldocs' with your patch
applied? What did you observe?


Lukas
