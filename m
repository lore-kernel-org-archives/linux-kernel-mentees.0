Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253CA1DC994
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  1 Jul 2025 11:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369379; cv=none; b=GbT35jxOCeeluj+24Xub36OaFpvqQFnRYbYcsanOPqARGbvismG+Cx8+wloQBzo9GpeqX6OQH4xEhnkk8cIb0uOOQceRPuU0QnNf0MNsE8HTsQ8zrwXflQV81JlO/L4AVprRjlmRM0yctb9JRf4GTpOV5XWglwe9WgTDxyc0p2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369379; c=relaxed/simple;
	bh=/uQArIpWv6jgks+MQz2FdbcZCHRD3fHAxYqX6fLBpUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tk4fqQ/4fEdVpQKmPrwEj3x0U7A3DYqk1UIgVQka+41/REl8R2QE24FrswYdS499pDLJGqhcRoLseUCK6KOsp0ONtU3xubZXB5jdyGw9HmW/TMMq/1jK0Kn/ilTFsXR7zkAm0/Jm5BKuMYmrqOsKuU7GHxzsB1tMJstCmalNux4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxmdB2Cg; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxmdB2Cg"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32b43846e8cso47874751fa.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 01 Jul 2025 04:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751369375; x=1751974175; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dICzWEcWfyURmGG1tAzlz5bT3KCvUrBKE1a6Eh/dqu0=;
        b=fxmdB2Cga7G9JIqoJRRgmN93GD9LwpzBLG/P6jwA0GZ9hcNknYioX1HMrJHnsJB4qI
         U4QRIwWUqx2MIyMaDjiZQtEA6KMdxWwkQQL+C6f8O74wHBf1XiAdHWYzJTxotmEccXGn
         Qs8ZXJe+iLLKq0mnMJgutmmdQxT5y7dGOS2/pU3gpJ3lJRZGvtRj51RVlbdtV2EFSYwz
         5BRbAmXGhxGBDpVtTZM5B1X6v3Fc+x+sjP6ypkFDf7DRSBY6qBnsqnKdLptdZkf/RDtU
         qNFmyyZJWm3GRRQw+lIwEQtfRXATVnll03TkzKLBFsWFFV5PxpqrTvtTwgIk2xk/VtaI
         qa7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751369375; x=1751974175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dICzWEcWfyURmGG1tAzlz5bT3KCvUrBKE1a6Eh/dqu0=;
        b=CM4Oz41lNG5bQEdeY84nhRFyrrHDp19JvI08uYps9/qfl4pXN3/cAszvdEqkCpXepW
         iZCQc/tvSQiXm/9YCl7gBtPA0zNBDqStKYWbTVg/1YPXwFWkiIq0R5hHR4iG3wPnYrqV
         6VEVzQnIaSDuzkb4hmRkhkIrXXxMwkbZtOCbCmEwbdPA5SP3dnY8lA4Ey9dbdVs7RKEh
         +QPZOaHvNKYuJACOOt3lHlL5Rrw6mcY3T8h8OSuaQWxVDg/24ZXQEAAHRdxlMfUqa8rY
         OuI84wcJBH8+LjoHSfqfzKFT1lK2DeIF9T8Nt5lmoa0g+NKTdly+Kvf3VSyyQ0dnSrBX
         qs9w==
X-Forwarded-Encrypted: i=1; AJvYcCWQDf1nuNY0tF5xRn+MLxU7a6IgfeAWDyl0enchW46GAhYmwmC/gWWPYTg6wqa0i/uby3ptMyNhoJzPz5MG8QnQf5V2+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YziCql4z33OCyo5DuGQ9wAfgRC98wpDdJjXLbxpLY+0TAT4qDCY
	tOIiK2vHAAX5KYQ16+7G3QyiabQQEnH3hO2SY5y2UM77m4M1i3/FsJyLeXjAcaaIMtbNop8xqQ7
	zK3B8zNuYReUatsfWJyYP9pZaUfDLbs0=
X-Gm-Gg: ASbGnct48mIN1EI9u1dQi3jH3H2fBdKx7JZ6e9QRz/EUoMEJ+1waewkd2QNpbT5/nEo
	KYDcoy4HY5qD8khfH0fZ053WTyD2eLOthiW3j1aMsj8kbHaUaK54QhUEVteaGSedP7JuESeZqie
	v0fnHPWL8wZdQWxYyBg5cAUEeI+lkHe1l9L3f3LM2PcbaxR5YovX1QFehit4KC6ptZnXA5t89Ez
	pwq
X-Google-Smtp-Source: AGHT+IFa6Y8dSDucSupqIAEE6/ssEZJPz40XEHljLpWrs5EbvtMthy+CRzrw4f9yRN6r2pcDsQDOR8NJ03CQvmy3BsY=
X-Received: by 2002:a05:651c:154b:b0:32c:bc69:e938 with SMTP id
 38308e7fff4ca-32df9e2d9f7mr5219611fa.20.1751369374735; Tue, 01 Jul 2025
 04:29:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250613134449.7459-1-pranav.tyagi03@gmail.com> <2025070154-cringe-tidings-20f5@gregkh>
In-Reply-To: <2025070154-cringe-tidings-20f5@gregkh>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Tue, 1 Jul 2025 16:59:23 +0530
X-Gm-Features: Ac12FXw89JSuAZTTqiDy7yiGTbpPr2ZNQEeLQSSY7id7dMW7zkv0bXRX-3tSChY
Message-ID: <CAH4c4jLAQghiQXMVB3-pYhoE0HiFPHdN3d7LT0rVCmJ-o6SP=A@mail.gmail.com>
Subject: Re: [PATCH] firmware/memmap: use scnprintf() in show funcs
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, chentao@kylinos.cn, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 3:57=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Fri, Jun 13, 2025 at 07:14:49PM +0530, Pranav Tyagi wrote:
> > Replace all snprintf() instances with scnprintf(). snprintf() returns
> > the number of bytes that would have been written had there been enough
> > space. For sysfs attributes, snprintf() should not be used for the
> > show() method. Instead use scnprintf() which returns the number of byte=
s
> > actually written.
>
> for sysfs attributes, sysfs_emit() should be used instead.  Why not do
> that here?
>
> But what is wrong with the current code?  Is it not working properly?
>
> thanks,
>
> greg k-h'

I had sent this patch earlier along with a few others of similar
nature. The code in question was working correctly. However, the
intent was to perform cleanups based on documentation guidance.

Specifically, for sysfs attributes, the documentation discourages
using snprintf() in the show() method since it returns the
number of bytes that would have been written, not the number
actually written. This can potentially lead to buffer overflows.

You had previously pointed out that either sysfs_emit() should
be used or the code should be left unchanged if it is working
correctly. To avoid unnecessary churn, I decided to drop those
( including this one ) patches entirely.

Regards
Pranav Tyagi
