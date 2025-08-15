Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D47AA92E
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 15 Aug 2025 06:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755239657; cv=none; b=BtnLEogSHxigWdFX8+UIE1kKe3l9RDDjxTifluK2F4YFlwJ9CiVHXt9jYHMlPJghCDo8JZ92KaZXTlR4jc5EViR8qpbneTrgKYG+RMdyl2xatxH0WSYu5/PKT6CMhDcRS58y/Ihnk5HGi0jb1Nr3DdTGP6mMJtUPvk2M/BynbKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755239657; c=relaxed/simple;
	bh=kuPdCpuTj1FBY4yhEPLgSb49bXec4fC3XCBOV2asUF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cmDyCvR4gU/qbA7LjLwire37CIFWtBbXS7eVuqyDmBZ6UGcp9DUnS3i5iOlYXV2mH1hwvVo3RwNv09FCEOsT/6LSKmAs5RLOhZkopovl3yFztqcy6WUyZ0vDauwGfdzLHcIifNwhPKeOKdWNqsYQpaQRbMTyBh1jkP45trj5EkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzsM1RFs; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzsM1RFs"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-71d603b60cbso14087687b3.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 14 Aug 2025 23:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755239655; x=1755844455; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuPdCpuTj1FBY4yhEPLgSb49bXec4fC3XCBOV2asUF4=;
        b=CzsM1RFsOUsgAfAX6cHAsy0pBjAPIxwautTSwRekuX/aA6XBaC/l9onXnrl/n+eGij
         4EnlsC3/lkgP19m/jWZ+SO4MuUozEbTFYxbQuIUbK3j6+sITwGAWkHWFXSDTecfGRO9A
         NnbAVRhdanA5FDOy9KoWzcZpBCo6nBY9Bq3sdp75plk3oKfZmDOIcLMVRn96gfcnlS/T
         pX4u5I7XHJX5TQzfInKdPp91+Kf4xTlwXDdXTC7AVdSlynhlra8DHxk5dQRNqMnTQxKp
         d5iTTw1HDb3Ruyc7QOgBeiNFMqHSk5VSCzoJCNstsNmPP8IKe2iWyW/gpv2+FXFKH3W9
         6qWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755239655; x=1755844455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kuPdCpuTj1FBY4yhEPLgSb49bXec4fC3XCBOV2asUF4=;
        b=gTK0OBuOeDtmuyq+xEjdsvsUPfCT2CNEPP9N7pTshZG/MNy66IaS3Jjls4sWOGIVqg
         SJVBhx9j3WARCoLQbpE4DqEcaiXbxtdou3UDOyDl/LkL56PQ5pyZ3b3lJ+3+9zTmcYu4
         W30YH9PnKElD9AGUv4qUaj8V/oS93ddA43U1WjkgtZmuzGL5e81wyBmItbKIjLppfHdo
         7UbmQdU2BqWO4IKtrOjRJbFIn71O9/qtl/sy0owCSIdjEGncm38IGW89AY0Kep0IpSNl
         R5EpFScFPyK9IAe+oSHY5Xuh6GkZe5fuMuvrJnH5Wm7GhlDL7obdjxZQjh05lpW/6oyu
         r6vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpjzsYMZl49Me3CTdH4iauGC/8x9NA9oI7NcHJCTA8RoKZ+BxI1GDfC+IRn/el+Lwfr7S6RQZdYqr5AGQo+suYWAtOEQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWtGyTO5UdFXa2SHeYCbyEYWMEDQZA9RonVk4iHHaF6lTXDdYQ
	F/D7Ng4QrH65q0JX3ya2Ri6p0xP0xTL5I0oQN0lX4o/IsvffvM5uh6ndyTi+VAVXdllA7tlDxxt
	E+kHmPzncTYxml4rjaZO57pvuS/ifapk=
X-Gm-Gg: ASbGncsl167nuCxygeytQKE8x/l/R2X2riUyoqCY22G9L9k0dadNgNE25zgUNRJb8Af
	P7cmneOfvJgbuaXH5HSdu7EMLOrEmUk9cdGOMUrxKnR0qavk9varQLmswzo7gLT42y/nUk81t5q
	margWCMoHdA52JLMR6CV326vtDFLtADySoTZVYsrUKfIRPQ6a9fRYm28a3kt8Gqs11bMeGbmUKy
	hCOBnEz2brSHr8oljnrPYo91zcqwI/jC707gBbq
X-Google-Smtp-Source: AGHT+IH4dxohOh7qqn9xS+FXF0LJU4Rn2rbnVst81GNs7v9pVTjVeAoxkPTiRwcWbs/IDQdt1EluIl9NmK/g5rkKxiw=
X-Received: by 2002:a05:690c:4c10:b0:71c:3de0:9687 with SMTP id
 00721157ae682-71e6dd33a93mr13502637b3.35.1755239654844; Thu, 14 Aug 2025
 23:34:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250814165403.616195-1-chandramohan.explore@gmail.com> <aJ6zKriNeoM4B/km@bhairav-test.ee.iitb.ac.in>
In-Reply-To: <aJ6zKriNeoM4B/km@bhairav-test.ee.iitb.ac.in>
From: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
Date: Fri, 15 Aug 2025 12:04:04 +0530
X-Gm-Features: Ac12FXwMQOi8Fm4tfQ_EIB_XLNT01Ea7X8vPl9CSOiR843YJyAaCBHL4B4dCFE0
Message-ID: <CADBJw5Zb7iOuzceDjeJ3e4JWAupxOTRnM62SmJFjv23vS-+bfQ@mail.gmail.com>
Subject: Re: [PATCH v2] apparmor: Remove unused value
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org, 
	serge@hallyn.com, apparmor@lists.ubuntu.com, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shuah@kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 9:40=E2=80=AFAM Akhilesh Patil <akhilesh@ee.iitb.ac=
.in> wrote:
>
> On Thu, Aug 14, 2025 at 10:24:01PM +0530, Chandra Mohan Sundar wrote:
> > The value "new" is being assigned to NULL but that statement does not
> > have effect since "new" is being overwritten in the subsequent
> > fallback case.
> >
> > Remove the unused value. This issue was reported by coverity static
> > analyzer.
>
> Hi Chandra. Do you have Coverity ID for this issue ?
>
Hi Akhilesh,

Sure. The Coverity id is 1662453 (
https://scan5.scan.coverity.com/#/project-view/65357/10063?selectedIssue=3D=
1662453
).

Thanks,
Chandra Mohan Sundar
