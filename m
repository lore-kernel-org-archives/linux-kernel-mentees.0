Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B86239567
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 28 Aug 2025 09:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756371879; cv=none; b=gIL9Wkb0SkNZg/X3NQf9/O2JlXNwELWiMOpW7gvsHBuq//LWyyafu1Fc3EwFvQGt/eQtVnPGLL4pcfDpdwB+GOAFmGY6V7QVHFqQuzcqrZrXM3mmDl2gbBO540RH8tiAuAF/Wqml8otSkkO+R5cOMBrndlH+inrpQfiWaE9HJp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756371879; c=relaxed/simple;
	bh=hRK0Sb+Fg+moOucKy1QoEZah/D9LVeRrBHJajkahztI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cEcqdGCeRoY0G02YfxjTv7GsHDWtvrQbTmcMp8EaJ3vNZWORY6MvjQzLnhQfZ782WpUFKNfmqGMk6rxix9zXcs3cqfuP72q0P7Pq5yajNlv7mFK2A70U6Y+AcKgFh5XO+iv5qu1R2Q1wurZoLr3O4gdDdubqG21SIeFT5gZ/WBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DuzZrICk; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DuzZrICk"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61cd6089262so804611a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 28 Aug 2025 02:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756371876; x=1756976676; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOx9lloLStGsUr/cYYKvjnib6ty7T7a+IBpLJTo9IUw=;
        b=DuzZrICk1a8w2JztWv5sFVCSF+cxthzpgZRMgn9+78/zMLjK3P4liqwb+xiYNQ3wzD
         RzY6eYSw+m9M0Ku51Hgpiwe/iqw1uqUxTt84KA2YNaY8tI+eWHGuem+Kr2HugVwyyIFf
         sLwp5PI+NbhDYTr6Ehe0UAghuG4hv5iDI6t1nXkH7BtQ0cGt2J8FEtviLUBvED9xCFbq
         GwiQbGECF5sZur8NVWMvooE1SFR+tfxpLlYkIGTbPrAAFTQy732N3FXXZJ1O4lV9w42E
         bFWwYX0zg7IDWhWoQFC3ns3XD8bgJX01gNDZAW06P/UrUSZOEwOZjPLv2/6pzHai99Od
         zQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756371876; x=1756976676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOx9lloLStGsUr/cYYKvjnib6ty7T7a+IBpLJTo9IUw=;
        b=pcpkEQcAugvOwcaOdhxiviN5Ay6NmBeU4Bn8n+1NUvWEHOF7ffVBFIdhX+QzImNpjg
         cyil+lOXRyCHhtsukYSn4CelLflbPE+2IHu/lG8R9UMcD2bahgizFK5HctMCq+upb6tR
         /WIT3dtenTyBUFu6sKLKFNWSiJQb/tPDojGcmq0M1+MyD+O/rX1Akw15S7Nc5egzJ8Uq
         Mg4OgDe6AR0kubGCo4xHWLi72e4E2tz5FpS4es3Lh4k1UnJaiBoNdp+lfT22zkIDeISn
         7BJVKS0wlvihgVGdGGMmuVKZWvCKtB+2rsvTdm7KP9R5Fsy+/9TT2jpVnZkV4sDIBWJE
         wW2A==
X-Gm-Message-State: AOJu0Yz01aPlu3IlzMoLQBiEewYPKhPI3Ti56gIUHU1xUmXwnAbNUeRa
	xb+0RFB+tRjqypU9LOirbTen45Ck+f7XvXnPLYStyU4Po/JCxA87r5P4hn8spdhLzIPnb0TbIr8
	HlrdTpFThNGo5Eq5mfgtEbPzW+3SJWGAMaBbM
X-Gm-Gg: ASbGncsrHlsPp7caK3RqVRHHWxFcl1Wdvx7+AeiTsGt4fXOCM5qDJ8GE9Rov6mT3gEo
	C/EzIv8bRTSP1vpmeSmg+p+Rj4NUMc4xMmv6Slwi18bBGwpg/O6cg3ZWXsD2C083LsraJ6UxiaW
	y0rR62o7jnChS48eDwKoF3Mgzov3f2bNaxcLobHwvEWW0SoqiRBecvSokMFc2ACtT9g/SK4rq5S
	V80k+pWlsNi17GzFOIwD0QhNMV78K/qX4HIWyNKK8narQk1hEixbg==
X-Google-Smtp-Source: AGHT+IHcJFdAifQIslq0uvKI3Rzbb5QbNWULfF1T2NaktyjXUhCqzNssX+4yvDW7YSazMP/SbZw+4iENUl4i3BebswE=
X-Received: by 2002:a05:6402:3591:b0:61c:cf9a:d479 with SMTP id
 4fb4d7f45d1cf-61ccf9ad68amr2039661a12.10.1756371875600; Thu, 28 Aug 2025
 02:04:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPrAcgM1nbq97SfZmVNonG-HTA8pQrUQ8_AH4xQ8qp97xFyxMw@mail.gmail.com>
In-Reply-To: <CAPrAcgM1nbq97SfZmVNonG-HTA8pQrUQ8_AH4xQ8qp97xFyxMw@mail.gmail.com>
From: viswanath <viswanathiyyappan@gmail.com>
Date: Thu, 28 Aug 2025 14:34:23 +0530
X-Gm-Features: Ac12FXxZR3b7Ve8IYF0o1KFJpVycXSOccolkwBQDjdXcF7SNOGd_gsnPRgbGAtA
Message-ID: <CAPrAcgPQV89s81AwGTyMw+NtAmB-2Th6P9Ymr2epQ5jy+ra6WA@mail.gmail.com>
Subject: Re: Query regarding Application Packet
To: linux-kernel-mentees@lists.linux.dev
Cc: Shuah Khan <skhan@linuxfoundation.org>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello team,

This part from https://wiki.linuxfoundation.org/lkmp was the source of my q=
uery.

```
Complete Skill evaluation & Application Contribution - 4 weeks

Step 3: Complete Skill evaluation task(s) assigned to you as task(s)
in LFX Mentorship.
Work on mentor assigned tasks to learn you project area.
Make small contributions to the projects. You are highly encouraged to
contribute to Linux kernel Documentation , and Selftests. Please cc
Shuah Khan, other project mentor(s), and Linux Kernel Mentees Archive
on all your contributions.
Report contributions
Bugfix report contributions

Complete application and submit: Application packet should contain a
short summary of your skills and what you learned during the 4 week
application period and include a report of all your contributions.
Upload your application to the =E2=80=9CSubmit Completed Application task=
=E2=80=9D.
```

Apologies if this is outdated and if there is no longer a "Submit
Completed Application" task or requirement for an application packet.

Thanks,
I Viswanath

On Thu, 28 Aug 2025 at 09:28, viswanath <viswanathiyyappan@gmail.com> wrote=
:
>
> Hello,
>      I have submitted all my tasks but I didn't get a "submit
> application packet" task in the portal and I thought I have to wait
> for it to appear.
>
>  My application is at the pending stage right now even though I have
> done all the tasks assigned to me.
>
> Can I mail the application packet or is
> it too late?
>
> Thanks,
> I Viswanath
