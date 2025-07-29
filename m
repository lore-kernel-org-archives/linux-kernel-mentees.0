Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775D8256C83
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 06:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753771080; cv=none; b=lMNuzfPJgcnVl2TW+pijdgjjDxujxWehD/+7c7NPZOWqIo2YfG9fxhDuKGcmOi4JDa9mR9qNtSw7BnuwwM7lt6FOhFTwtlwIKjXqAOz/aRev64NEHfrFZvAsAB5A1k0PdESPYswZxpHC9vpoyaNxY7dKsLeOunxa9bPD1seohyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753771080; c=relaxed/simple;
	bh=naZF03yVuyzWmjfRvic70Y5lL7P4g66xW16e2TzlWes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MgLH/ALzMlNmIWvZyFwHkTwcQmtjgD0BB5tHGb4PwQbPUuHxTqtuodrt9rI19wzwSsV/t6sPcYx5OnVqiSWw5oXuCwmuuJVMS/XU4to6nlApOGlw2iWeilbDjGCEP+TOlKBztVd9Q+1P7JNbbMGzHznwkIfsNQmV9DrdoEzO1gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nm73Pgci; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nm73Pgci"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-303058a8649so1707578fac.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Jul 2025 23:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753771078; x=1754375878; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mhCwXIaYxmo7Z4nAHipCVOWynp0zVrQxnE8q06yN35o=;
        b=Nm73PgciO1nJg/v85UbyoVmvHztAT/4ihXGQHPamEM/H2ToJKI9eIpKYDkd9LuRvtY
         bz+hZh6fu2Usr3dWU4YBheKGVvHA4QHTALJojwH60pE7dpTMUSLIzWKsK/uhy82wnDuI
         DyVQgf5QVxUppD53nIwvqVYc4V6YXaXLq2zj88zEgQx8qxikp2sSJPhjD/3j797BDf2y
         oV8UauGY5BGiBa2m48wm8PW1bzYLfIpWZqH/QAdyRGnUieksu+Ivs9PRgcXy67EjeDZ/
         0+wX7Bzxm9zvY+UDVPtPT9FvhWxazVt/j6jvri4sIR1JS9l8YX0AM8fTQpXUw49unqWR
         JHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753771078; x=1754375878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhCwXIaYxmo7Z4nAHipCVOWynp0zVrQxnE8q06yN35o=;
        b=k0eKk6HPwikrMcKzgBam0sOT9mm8Uw7g9hrT/N8Blhld0lrsWvf0+aVQvNas7+hcsc
         Uv+YvdUtv5FNk7oyQp2dM0qTUnTGepxOONYTWAgD8KHe2ReEwtgLUAuhrqLA8FzmCjRN
         OYItNe+A0jee8TnkWMJci+y7ceZbhQ7JxZ9xfzdcHMtkAqQa6slBHGB8LOjDDrJGZM0a
         U81UHPHTXAKP39ezMB0vr2LRnwZ88th5X0ubJN/xLf487AbwKwiFu7rhPRfCqEOOzlK+
         5QMXPe71AjdAP4MjrGUnA9i87L0eXDx8GJiHt1aOawFEKAEeRJRAIczrdHrk2AwquGsR
         faVA==
X-Forwarded-Encrypted: i=1; AJvYcCW8zHSCmCgdQN5xhdwQisaCvWVef5gd0ft36ji8dDEY79/h3bmR3do4PNdijm8QcrnWMZLq3N+RzV/zhKOEtH5dSosZog==@lists.linux.dev
X-Gm-Message-State: AOJu0YxhBpmQQ0hwn8RNGBnJPpnjuaiqT8WLVScVDZUT3e9+x8VpImfW
	1srnHTBhEQ7pN7Mg0tfkvxxaF6hvwpww1W4FiuVJ1e8jsxyErY65EM7m1O6qaM1EylYbCjZmhpb
	EBBbD+QrOReCbobBTheLaMPvFe9ZJrew=
X-Gm-Gg: ASbGncur6M8L8UkPYJyoJxlSjOcWxiGBCM+C7iFQ9OY6XlBe24plJ/2fgd1wK96vs7e
	HZ+xUDCmi+w/m8UREfaNnESd78MhvgvtY20wuuC07sSbOcpTI9YABYBWkwjr5UyZstq54e3cmQO
	pgBe+dHwFeMxmMXGv8dOZStOpahyW3tyS+FyivUkkeT3NACcwJVLufuAjW7t3AxgTsYK2eAW2er
	ebRMDeR
X-Google-Smtp-Source: AGHT+IHq5dBQEHPn+wOw5U80KePwd2X2LC3B3SHZ6AGfb6CcYPi59PsdfIAL3XedQFjGq+dUKM0hm1XydfY8mUO4vb8=
X-Received: by 2002:a05:6870:356:b0:2d6:245:a9b3 with SMTP id
 586e51a60fabf-30701e2e8acmr9527052fac.6.1753771078306; Mon, 28 Jul 2025
 23:37:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250729053359.49258-1-suchitkarunakaran@gmail.com> <2025072935-mardi-propeller-0d29@gregkh>
In-Reply-To: <2025072935-mardi-propeller-0d29@gregkh>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Tue, 29 Jul 2025 12:07:46 +0530
X-Gm-Features: Ac12FXxrrylrnNIE4Lfr5SOeXK870lZtcpnjc0R9SpK8CDLzvaVq9BoUlX5HvTU
Message-ID: <CAO9wTFj8d3Toafof0MBvPybfDMsAAuJ4rxrH0EMcVqZZrg0VCA@mail.gmail.com>
Subject: Re: [PATCH] tsacct: Remove unused macro definition
To: Greg KH <gregkh@linuxfoundation.org>
Cc: skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Jul 2025 at 11:22, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jul 29, 2025 at 11:03:59AM +0530, Suchit Karunakaran wrote:
> > The MB macro was defined in tsacct.c but never used, leading to a compiler
> > warning. This patch removes the unused definition to clean up the code and
> > suppress the warning.
>
> What compiler warning shows this?  As part of a normal build?
>

It's not part of the normal build. I built the kernel with C=1 and V=1 flags.

> We have loads of defines that are not used, especially in drivers, are
> we now going to start deleting them all?
>

Agreed, sorry for the inconvenience.
