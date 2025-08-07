Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DCC262FE6
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  7 Aug 2025 15:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754579380; cv=none; b=f7wEVcpnYbycoadoIshA+steo7u7VqVtd6wznY9g/xUUoCWQfdt9bLpnfRJPzX7M31TtR2pjtfEMmj5CvxJUUSMx8VR4qpARclad6K+YYQ5yi6h8+6s/STiTKoNOMMKbZMrNaNaV4YqaK4JfiDOuU590UdzcUiF/OZjRTVxlHEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754579380; c=relaxed/simple;
	bh=vXI9Zam5eYCmdhXZAZEND+qlnOZtF3m0aq2gFtw/4+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pkJC6S71WgDEhbdjHjtLIhBaJqDtuX8auFELj3J5Mn0QHAmSaw5er1kUVDA4ltqVqaSfzAf9/BwBZnVGLIqm15O+BtjQ8XbKBG8Yjh/h6TBVMhCAZ5xPlj+8pUpZ8OVfzBwjWAcMsI1gf/JHwRnf1DUfcB7MUk7Zm91s8e25WgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fv49FRm6; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fv49FRm6"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2403c13cac3so16536165ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 07 Aug 2025 08:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754579377; x=1755184177; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXI9Zam5eYCmdhXZAZEND+qlnOZtF3m0aq2gFtw/4+4=;
        b=Fv49FRm69wWh6+hODzj0IGxrDBmDJ1viOl/Jf7OFHMO4fT6n26MJtFnMPOC/FcepQh
         LAhlaqz5GXu4d6u0l57+ou8hq1OxPeT3sJ3HaeBn/JPmxe7GA0cTPSjQp8c8kNmcgjK3
         5I/qcmsSq0lReW2yiTcu6jlqxT2LIB6BjgtCaeEnzlcx76rgXaktfdUvUoHIURpUPve2
         XRn0vFuzw40zJt1+RDXNxocHqGvl61HOpz59zmbtGKdWa6Q4uWLG4v7LjOMX+oXv19Uu
         aQUCbUzmmBQGsKCrHJnrRe62z5iXsQn+7FHOlUKUOfIxQ5HXOQ/9TN8qcdoYbUjUHAqY
         Z4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754579377; x=1755184177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXI9Zam5eYCmdhXZAZEND+qlnOZtF3m0aq2gFtw/4+4=;
        b=rVUuKv2mI9t8EEt8ZHRU+qFos4XaeemFzp0Qi/sCynJpFDk3VIhEK1xmJstIPyDqRb
         oddS1Zh6fwz/sftU+LHeZ3o96hxUgElg/hBLy+lgdnCi4jhyTWvjya9jdfY1dmbTNZTx
         Qk6mefQZVdqt1LwIyzcQwetB6OYYYPOy8HbmP+qIGL+lzAtJNNhDIsc06cvIqQ6bpNjH
         zWiAK8JaA+9eueK0DKrOl4cUeu7nNT2CHW+Y9wu9fRWl2gf5I9FYBGJeGXWnzIpavWrN
         wNei/h4DRnltxBUAKom43fx0tF0SmdJ8CCOawPu9uPPZ6TyzzyQVyrcoXbzwO1oPUx4p
         C3xw==
X-Forwarded-Encrypted: i=1; AJvYcCWhVTo5Z8DEcI0gRRcqCycud6Zf9PlcCyeK0argwVCx+p56bSGdJtdqsaWx/MXdgY6iHKeWBoSVusCE+PyVmTBdd7w5NA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwejngJm5tBdFI53pRvnFyAjV66Kxra5JitRtRNUC8l7joeeQzQ
	aTZpS0BapDJQUpuAeewcz9Lf0ErsXDRSpNvbBI3L0qD5WO2Wt2j4O0XTPAKzEz7FjjYx6WAeYls
	lvBuhCDs7n6lva7iDA7w5XFQGqMj0eJ8IcvlwYzTT
X-Gm-Gg: ASbGncs3Wa703BBLdojO5V4uwyBiJXnyMUESziyOdduQN4tT+ONluw/z40S01qmyVHe
	a1iaTdjCLGxUFGO77h4uc3Q/PjHHI1VxMQgZ3xBDt08D4tnVECxoW6kkOs9cYr98mAldFI5j9IM
	wSR7AxMFQG1k1QSUa9kn7a+59S4BlhtFOd3l8gZjnijtw17076DgLakJoPRhxqQ/7SW32b7prs4
	Y3ptaMMYak5JWHADNZenZHicqZOK22V64YWPVHKZOIwT6Pq
X-Google-Smtp-Source: AGHT+IG8QlJyGrI/LcZsqPJ4tTpGg3cKXVWXjR1Ly1wLcsKoXFz1GMnQ///H1MLhMEXGNQE8r3JHiVH9uD53B/zlYEk=
X-Received: by 2002:a17:902:f64a:b0:240:4d19:8774 with SMTP id
 d9443c01a7336-242b076a24amr47832795ad.24.1754579376834; Thu, 07 Aug 2025
 08:09:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250722100743.38914e9a@kernel.org> <20250723162547.1395048-1-nogikh@google.com>
 <20250723094720.3e41b6ed@kernel.org> <20250807064116.6aa8e14f@kernel.org>
In-Reply-To: <20250807064116.6aa8e14f@kernel.org>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Thu, 7 Aug 2025 17:09:24 +0200
X-Gm-Features: Ac12FXyf-LII2oKhENT74R1IUHeqtiItmnUOlh8HIq0rExOfD6gVb883YMc88zw
Message-ID: <CANp29Y5mZJJgn5LYDiLx11bH__NXZ32ut6VUTsEyXwqrOhksTw@mail.gmail.com>
Subject: Re: [syzbot ci] Re: net: Revert tx queue length on partial failure in dev_qdisc_change_tx_queue_len()
To: Jakub Kicinski <kuba@kernel.org>
Cc: dvyukov@google.com, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, syzbot@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

On Thu, Aug 7, 2025 at 3:41=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Wed, 23 Jul 2025 09:47:20 -0700 Jakub Kicinski wrote:
> > On Wed, 23 Jul 2025 18:25:47 +0200 Aleksandr Nogikh wrote:
> > > On Tue, 22 Jul 2025 Jakub Kicinski wrote:
> > > > I think this email is missing a References: header ?
> > > > It doesn't get threaded properly.
> > >
> > > Yes, that was indeed a bug that has now been fixed, thanks for
> > > reaching out!
> >
> > Thank you!
>
> One more thing, would it be possible to add / correct the DKIM on these
> messages? Looks like when our bots load the syzbot ci emails from lore
> the DKIM verification fails. I see a X-Google-DKIM-Signature: header,
> but no real DKIM-Signature:

Thanks for letting us know!
Do these bots also face DKIM verification issues with regular syzbot
emails? We send them absolutely the same way, so the problem must
affect all reports.

We use the GAE Mail API, and its documentation[1] says that it signs
emails with DKIM only if a custom domain is configured. Since we send
from the default GAE domain, this would explain the verification
failures.

We'll explore the ways to fix this.

[1] https://cloud.google.com/appengine/docs/standard/services/mail?tab=3Dgo=
#authentication_with_domainkeys_identified_mail_dkim

--=20
Aleksandr
