Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04B61BE236
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 23 Oct 2024 15:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729696610; cv=none; b=YxbwbF+yzoIwgjOEbv/eNsWpomEK12RwV2jSAXcqY2OWYWpF5UhWhJRHEgaOm/88uqzuBHeqwMXd2M4H//pLe5/k/Y82qhE2rQpOwNpnSDwO/h2qRv/Zc0X+OghCbZC/8cCVsbhrQNmuifwDCJfVnZ0lTYKlnofloUZ/JxJf8MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729696610; c=relaxed/simple;
	bh=FZaeFxwTakHihLrqx989jDhtPM0HQAzJj+unQOQ1nZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kSLeghGGcM2y8g65Ty7fH9r4oCALEbBbEGQjM/1lurY+fwZDjwtg7OkXz9nf5DciWF8ntbjDHILxDJoGNVthkMJpXDMq5CvGgCdil5Yjwi+udSVV1UKX3wJD78tIaHnUuWp8c0qIM40FFxJjusytWOSYgEK5M7Isb0OjyIWZpr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U07Kl4+s; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U07Kl4+s"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B6D640236
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 23 Oct 2024 15:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rzc9C1RePKXJ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Oct 2024 15:16:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=0xff07@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3487B40104
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3487B40104
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U07Kl4+s
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3487B40104
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 23 Oct 2024 15:16:47 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5c9c28c1ecbso8974426a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 23 Oct 2024 08:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729696605; x=1730301405; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phceHAwg+WXY0lkOFYuZkDTZVc3u9dtw1vIObZgqv+A=;
        b=U07Kl4+sT3dNmVZDijaIxzkZD085gXW0sXXX1i4VJKQOY/6H3FWv+6m44mY19W331a
         j4b65Xc6OC+1aXvQvPlF3gVMah8WTu0pQYXJ4qx2HW9v6L+UF6VnL4UQYqckNYu++cT4
         F0KhgI/UFECfHmuj3QIwDgWZxrm3h5PuMJQWaptdt348yV7OUiyf4uYJwAdLUUz0jaIq
         c01Bu/LP/eTzerL/LTQaRMwD83wosq4d/OYkgWQP1maqT7yyhdYUL5Qbhm8c1GrjPbcP
         C2UAO6A+7vkJZfei7lu1uWKy8ezt34tjKma2OcrPEkckdatdcqEhavdODiIlUszbMHut
         x5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729696605; x=1730301405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=phceHAwg+WXY0lkOFYuZkDTZVc3u9dtw1vIObZgqv+A=;
        b=j5D3VFoxwTqVRHzv0FBSwXt/dU7848E0tSU/d/q+1A25MeYdXInl/EuvqX94uaYNck
         KcEA+6FS9PG9C0AmJGt/bRzXdAcR2QMz1PNMLNjP3GC08UhFRKSG9FldS1l4XRRocfr/
         VAavq7kn46Gl8G6UTUuaCnoEkSzG2/XDHDwPk7Po9ZQRXFVd97dtnKlz4vDPkxyw04Fu
         JSvLLRARnyt8LijoiNsid3xeXUPe3JZ95PrcNOXrhvSnFTKN0IvbfGbJ+ZAsobQkx/Pb
         ckrek/zIBJOozEE1HS1jcgcCpsvtZn1ilHkQhQgDNt7xjj4yc5d9ICI5K9KuxJTrhJb8
         +APQ==
X-Gm-Message-State: AOJu0Yy5aTzKnBugXqjpbEkDqNtskcj4gGCXC/nkqVxccRqXPtcV06H9
	z5RVgUxF7sOrVlfvS6TQsiz0CtLidXYSkksAfzOVSlTAs3wyh8Boa7rOO07epxlPRNjFtZkQknR
	ZdQIa7alwQjhUaL7sMmkHkKjnumY=
X-Google-Smtp-Source: AGHT+IGoe9wcQG7zaMf2n0bH4O9DhUNomfztRdDZyWgHh9DssAx3EIjRggFtWPZ2Zdqal/AXcNMgxtzRrpvIThvqlJc=
X-Received: by 2002:a05:6402:42ca:b0:5c9:6f8f:d7c6 with SMTP id
 4fb4d7f45d1cf-5cb8ace953fmr2572362a12.13.1729696604707; Wed, 23 Oct 2024
 08:16:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240922132636.34413-1-0xff07@gmail.com> <20240926005952.5ba2fda4@rorschach.local.home>
In-Reply-To: <20240926005952.5ba2fda4@rorschach.local.home>
From: Yo-Jung Lin <0xff07@gmail.com>
Date: Wed, 23 Oct 2024 23:16:32 +0800
Message-ID: <CAHhBtNomV6bCcau7sVU9G=pPWtX3XTvr4_pEkjqLGzs=-OZLUA@mail.gmail.com>
Subject: Re: [PATCH] trace doc: document the device_pm_callback events
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, ricardo@marliere.net, 
	skhan@linuxfoundation.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rafael and the PM maintainers,

On Thu, Sep 26, 2024 at 12:59=E2=80=AFPM Steven Rostedt <rostedt@goodmis.or=
g> wrote:
>
>
> This needs an ack from one of the power management maintainers.
>
> -- Steve
>
>
> On Sun, 22 Sep 2024 21:26:28 +0800
> "Yo-Jung (Leo) Lin" <0xff07@gmail.com> wrote:
>
> > Add documentation for the device_pm_callback_{start, end} events
> > under the "Subsystem Trace Points: power" section.
> >
> > Signed-off-by: Yo-Jung (Leo) Lin <0xff07@gmail.com>
> > ---
> >  Documentation/trace/events-power.rst | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >
> > diff --git a/Documentation/trace/events-power.rst b/Documentation/trace=
/events-power.rst
> > index f45bf11fa88d..7031954f7ed3 100644
> > --- a/Documentation/trace/events-power.rst
> > +++ b/Documentation/trace/events-power.rst
> > @@ -102,3 +102,30 @@ And, there are events used for CPU latency QoS add=
/update/remove request.
> >    pm_qos_remove_request     "value=3D%d"
> >
> >  The parameter is the value to be added/updated/removed.
> > +
> > +5. Device PM callback events
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > +The device PM callback events are placed right before and after an inv=
ocation of
> > +a device PM callback during a system-wide suspend/resume attempt.
> > +::
> > +
> > +  device_pm_callback_start     "%s %s, parent: %s, %s[%s]"
> > +  device_pm_callback_end       "%s %s, err=3D%d"
> > +
> > +The first two parameters in both events are the same. They are:
> > +
> > +  - The name of the driver.
> > +  - The device whose PM callbacks get called.
> > +
> > +For device_pm_callback_start, the rest of the parameters are:
> > +
> > +  - The parent device of the device (if any).
> > +  - Level in the power management hierarchy the callback belongs to (e=
.g. power
> > +    domain, type, class, bus, driver). Some stages (e.g. early, late, =
noirq)
> > +    will also be explicitly mentioned in this string.
> > +  - The ongoing PM event. You may find definitions of those events in =
the
> > +    PM_EVENT_* macros in include/linux/pm.h
> > +
> > +For device_pm_callback_end, the only remaining parameter is:
> > +
> > +  - The return value of the PM callback.
>

I think it'll be helpful to have your feedback on this documentation
proposal. Would you kindly help take a look? I believe that any
feedback would be really helpful. Thank you!

Best,
Leo
