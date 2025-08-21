Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E392BD5B3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 13:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783213; cv=none; b=R9OCW5Z9GQDlmGlYWp1T7eV7nDXa8Ak3IFsB/y8DnxpD4kOc3GZ0tSOQtDwdCyicENigg/O2snozbffbpoF3HI0YOU+kyY3JxA9dWYWrh2i0JR1oDCJK1CF4Y9g7TO/tmSn/l0D/3QKywtdXSvInfGgcJ1slr0/uk4fsCGc7J/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783213; c=relaxed/simple;
	bh=ekjoLLvd+gdePODFcTvZOLsqmOsc4ETLQT/D/x7qjo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lnbCqJlUj8ZiF41/O2AmZIOzVjNidOGoMpdeMnc+OK9SMjlIRWdz2r1OMPqrqJVM9ghE38n2qQjMzfHNEWCuClstHilPTq3fiVXu5nVUIpSDp9fVYwlJK6Iq8mwNMpUhktfcLj28otxHb3qcvhPWe5HPPK3GyrT/gFT9z3YL4ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzfhuOqi; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzfhuOqi"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41D5A8430D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 13:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TiCsKiUdLdmi for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Aug 2025 13:33:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=alexdeucher@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A868A84308
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A868A84308
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lzfhuOqi
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A868A84308
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 13:33:31 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-24458051ac6so1409955ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 06:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755783211; x=1756388011; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBxFLGvGtKMlnx45gYA4Cz7A7SuVyCHmLHRhQN6QlRU=;
        b=lzfhuOqiKVvHjGQUz1v3FWLop8u3/ZmnBTIjHkwTLC6r1yssK1DmqQwXtpfFNQnvN2
         ORmcLxqiHnEdtI3GZLzxsfuWLXPAtOgVYfWFSLhi1I+FswY0MJjQ2F14blhVyE/gIRL/
         yDZaUDgtqF4XuQ+W5DTdsW1P+XGAUXYYsxO5jOk6hp6lJsyUgZV+eW/t4g3BzA1ip7F6
         cfF7bhR53/r/odXA8INYDIZYv6erRZJNd7PZkaMt6w4TFY+x2ubeH7RIn5W4XamAkTcU
         MMT16Z1760BKdKrH8rZN+u4ty3y5JPu6xmMUwfas8Are1vW8Pucyx+aGLm8UKiBc8QDG
         Wubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783211; x=1756388011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBxFLGvGtKMlnx45gYA4Cz7A7SuVyCHmLHRhQN6QlRU=;
        b=DBHep50C9dp29BD+hfGrjqdj+FWD8+ZsGMHOjT5yMUl4R+7XdssShtX90Lf10YPmIw
         YFsr3CvZ8nszM9S4bFAnqN13/dYhJLVHOPci225JNoB+L95DbZC5p1nhiuYrPZtlncmu
         YGWhUZMJ7kLDXDn6ziFs+96sDlhVpavhhbVdRlriE5flccp176jFGXViUGo2vpAWD+Lt
         i6gIDZzj+7agmOpSElF2OpIVEivEs5iMWybTgfWa+yk8xdTbCCJ9jeeC41P0aGBJSCyG
         P72HTQFu2Z+nnbz1PlhAN0+C2oxHnHa8C+7PPxfplFBG1u6ZbkR0zk/c2jC3PmEAZOxV
         RxMg==
X-Forwarded-Encrypted: i=1; AJvYcCWBh/jqjfqwMXIA3BF6MIPuhT+eetsX7odSb6yvvv4jCzO2TR3iIO55c+ksgDTq2EjQ0PtMDInbspQ2xfNB+HrgRA3sQQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yxse3mQVgp/6GZ7gEAcsF5XFgAwrs9uhzJH2qJ/8ciizU4ZBnZk
	roi8iXtJ/F68ENSKHXjRmbxGKP7fJK075yGoq53/EyFfsOI/kNp/4/VEq+GPLjqJ08GP7AcG/lg
	tUmpkbj18oFOTEQgk9wztCzS/xCzf9gQ=
X-Gm-Gg: ASbGnctneZtM2/XgZTTVFlsSoQcN5vHrVRdaXgEd9Say0mKYb78HWqxknWtmGok/ItU
	SksIxleafetN1iZrX/RAugFe5N2VKc0LeoFUDNoVLGsKbzAPhKSgriZyhADgninJSchqxbsCAA0
	yRYO8YG9xVvRjViHLCIKn1IxGW9ATWuqAP6QeJA4OhARkmz2DedPUF2uOklD0XZfV/zmgIFJ+R3
	rGtZXE=
X-Google-Smtp-Source: AGHT+IEuCQ6k8cNE+8sXidC6dTieVXzmZcwZNDvgdItA/Y3JbANb5UvxKWSYjqg/c7kzUg+S2Z0QM3uU5S2Y9I5QyhQ=
X-Received: by 2002:a17:902:c40c:b0:243:589d:148e with SMTP id
 d9443c01a7336-245fec1d6e3mr18972085ad.5.1755783210910; Thu, 21 Aug 2025
 06:33:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250821025957.22546-1-rakuram.e96@gmail.com> <20250821025957.22546-2-rakuram.e96@gmail.com>
 <0254008f-1cdf-480f-ad6f-8f002b35d754@infradead.org>
In-Reply-To: <0254008f-1cdf-480f-ad6f-8f002b35d754@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 21 Aug 2025 09:33:19 -0400
X-Gm-Features: Ac12FXzO09gUoAEeRmxWArYXJpVeci5zNo9-7QWsRLPt3DMdtEe9qdrBP4alMe4
Message-ID: <CADnq5_NdRc+c18V7FuL+U4=C3zUUoAgP15rzu1wZ-U9hNzjcXQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs: gpu: amdgpu: Fix spelling in amdgpu documentation
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Rakuram Eswaran <rakuram.e96@gmail.com>, linux-doc@vger.kernel.org, 
	alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
	corbet@lwn.net, tzimmermann@suse.de, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, simona@ffwll.ch, siqueira@igalia.com, 
	harry.wentland@amd.com, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

Alex

On Wed, Aug 20, 2025 at 11:13=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
>
>
> On 8/20/25 7:59 PM, Rakuram Eswaran wrote:
> > Fixed following typos reported by Codespell
> >
> > 1. propogated =3D=3D> propagated
> >    aperatures =3D=3D> apertures
> > In Documentation/gpu/amdgpu/debugfs.rst
> >
> > 2. parition =3D=3D> partition
> > In Documentation/gpu/amdgpu/process-isolation.rst
> >
> > 3. conections =3D=3D> connections
> > In Documentation/gpu/amdgpu/display/programming-model-dcn.rst
> >
> > In addition to above,
> > Fixed wrong bit-partition naming in gpu/amdgpu/process-isolation.rst
> > from "fourth" partition to "third" partition.
> >
> > Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> > Suggested-by: Alexander Deucher <Alexander.Deucher@amd.com>
> > Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>
> Thanks.
>
> > ---
> >  Documentation/gpu/amdgpu/debugfs.rst                       | 4 ++--
> >  Documentation/gpu/amdgpu/display/programming-model-dcn.rst | 2 +-
> >  Documentation/gpu/amdgpu/process-isolation.rst             | 2 +-
> >  3 files changed, 4 insertions(+), 4 deletions(-)
>
>
> --
> ~Randy
