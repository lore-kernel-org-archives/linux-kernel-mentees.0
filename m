Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3F3155308
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Oct 2024 15:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727970359; cv=none; b=piYtlf7QkNptYVGQFz6O2Pfh2FFix+YX6oGb6KQf2XBqinhEl3XJVbNVJ/8svl+oo3m+8rQaTjp3DDLCsSoslHjcMlZlzN8WfwpzKpfjn2mrm3bf1Nogcrk+Q2jEupOM+dVmMcrl9lQQcTZW9vRrK2/qgOeLUrbxJ6t/AJMzogo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727970359; c=relaxed/simple;
	bh=DqThQ4pDP9vTG5GR7NWXXv/ygMY0KITCslz7wHpv780=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DvXeOuk3dkWBWOM1dVmkWOgXnxy9WckV/TpDKOm5gImVnZVJBy7vwOwIu/cq4tnNXIn/oQfYT5oJzLsBm/Mm5U6xFo0HThAjZTfGWJO5LMTo0prbFzWtxZ0Ud6yzZ+yfzDmxhNL90gofGw6QvUQ7t7mDNjw6Xm6MNPJM8EOQU9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUcmcTen; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUcmcTen"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 608E2400FB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Oct 2024 15:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eqkSJN4OJ2Nl for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Oct 2024 15:45:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com; envelope-from=lanzano.alex@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7828440B7B
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7828440B7B
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QUcmcTen
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7828440B7B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Oct 2024 15:45:57 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7a99de9beb2so62964785a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 03 Oct 2024 08:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727970356; x=1728575156; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L2nFqSHnerYWNOViSxQusgw7yMTCBN7rx6/Qgg/L014=;
        b=QUcmcTencZ5nujhItTTMmDc16DQ3Ov9Kq+QYR+saUf5DAygVbFECcGz0Gokxjdkp9F
         zZaaT9Ti6zh7EUe31ZI0AU4b1H1RY4/SNPWmbeekGaictQv+DHpb//67UQM4omGG22YO
         inql4xS2sJvVTUUZYDeYAth4ingBnsdm6PgH146/S9+APcb6ES9cbpJrChjB5FOR2VwM
         h1t4d4pFAHIjio8yA1KGN4VqvMeG8bXua9wzKR2Ax6C1fCYSwtasQnnkJOSsvzoZESyM
         Pi7fvuMvYsypr+R3Qdb8lF/n+NfrDXJE1sv/u+noBKFzEs9bLBCZq9VS86+wljuhW/Bl
         yc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727970356; x=1728575156;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L2nFqSHnerYWNOViSxQusgw7yMTCBN7rx6/Qgg/L014=;
        b=LpDON51cc6NvYZJ6wRP2OxLviFe4hGDhjgaSjB7rcgs6LqsG3fu0WzNmf+GbKmKPHN
         mwXObdsl1ffX9gJNLzOUpFliwwi3XtjdlFFBuwtbauNlHj6ba/upq5q12qfDu1HB1Z1T
         bRQsXXAwWa1lwVfcQ/uLRfUCVmLau5wryW+ERshnG1bRu/ERSJSeP4122JF6yw6wYePD
         BlzRhM6VvQSZ0D1J+rYMFUIRPeQXnURa1QBxBS58gtvbccrjaruX8yrJex8seaaN9jTu
         dlPoBTj39/gdrvFsMf6WmRIWzB49Bl3/mvZsFyl5wF7iR/3uAYr8ELN3od25MUD7Z916
         Ht8w==
X-Forwarded-Encrypted: i=1; AJvYcCUS6cT0RUfQ0afE/C3eVZm1LsLCn0AlKz29zUe7DXbcOuk8o80+skCX0txayl6qKOjdHSJ0YkLYtu5MqAYozrRFWlwEtw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yywwktb7/JzV668KQ//ICPP6c4BgToRnoQQun8kbWfL8cyfhrZm
	t/l3sFGerkLB4WKYFT40OaurwT9FmwX+W6fxZWomrG9c33i+xhlO
X-Google-Smtp-Source: AGHT+IHZBTbeMUL5KqSIdlIsTi4jsvld9rbEJPgXHMZ4S9+FWr6RXYwMwnLXLpDeQReSAPIV3rqe0w==
X-Received: by 2002:a05:620a:470f:b0:7a3:785a:dc1c with SMTP id af79cd13be357-7ae62727a6amr1128481685a.50.1727970355946;
        Thu, 03 Oct 2024 08:45:55 -0700 (PDT)
Received: from VM-Arch ([2600:1001:b14f:5ed5:a130:4dde:abcd:f635])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae6b1409dbsm61011385a.0.2024.10.03.08.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 08:45:55 -0700 (PDT)
Date: Thu, 3 Oct 2024 11:45:51 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Mehdi Djait <mehdi.djait@bootlin.com>, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v8 0/2] Add driver for Sharp Memory LCD
Message-ID: <seex6vou5hig2qguejt7hfi5s5muikxch64f2d5fh2kcbs4tau@332xy75kvobl>
References: <20241002033807.682177-1-lanzano.alex@gmail.com>
 <t4lefcykpoe5i36wb4x5u23sseh6drnphtivuqc3mjviat2vvc@7hg4jyhxvpye>
 <ees3m2qmazah2547ys62zvbrvo4dsgki2z2jwulwz4dfjtm4hk@kpmlapv6occv>
 <q53inyaxyvfib7okxzazepxzarqmq4rubbasumvvx2woioyp42@fbtn4poujsyh>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <q53inyaxyvfib7okxzazepxzarqmq4rubbasumvvx2woioyp42@fbtn4poujsyh>

On Thu, Oct 03, 2024 at 11:27:43AM GMT, Uwe Kleine-König wrote:
> Hello Alex,
> 
> On Wed, Oct 02, 2024 at 10:33:13PM -0400, Alex Lanzano wrote:
> > On Wed, Oct 02, 2024 at 09:56:38AM GMT, Uwe Kleine-König wrote:
> > > On Tue, Oct 01, 2024 at 11:37:35PM -0400, Alex Lanzano wrote:
> > > > Changes in v8:
> > > > - Addressed review comments from Uwe
> > > >     - Replace pwm_get_state with pwm_init_state
> > > >     - Use pwm_set_relative_duty_cycle instead of manually setting period and duty cycle
> > > 
> > > You didn't explicitly mention that it's fine if the PWM doesn't emit the
> > > inactive state when you call pwm_disable(). You're code should continue
> > > to work if you drop all calls to pwm_disable().
> > > 
> > > Ideally you mention that in a code comment to make others reading your
> > > code understand that.
> > 
> > Sorry about that! The intent of the code is to stop the pwm from outputing
> > when the display is disabled since the signal is no longer needed. If
> > it's best to emit the inactive state rather than calling pwm_disable()
> > I'm fine with making that change.
> 
> Calling pwm_disable() is best iff you don't care about the output any
> more. If however you rely on it to emit the inactive level,
> pwm_disable() is wrong. I don't know enough about your display to judge
> from here.
> 
> The code to disable the display looks (simplified) as follows:
> 
> 	if (smd->enable_gpio)
> 		gpiod_set_value(smd->enable_gpio, 0);
> 
> 	pwm_disable(smd->pwm_vcom_signal);
> 
> so maybe the logic you need is:
> 
> 	if (smd->enable_gpio) {
> 		gpiod_set_value(smd->enable_gpio, 0);
> 
> 		/*
> 		 * In the presence of a GPIO to disable the display the
> 		 * behaviour of the PWM doesn't matter and we can
> 		 * just disable it.
> 		 */
> 		pwm_disable(smd->pwm_vcom_signal);
> 	} else {
> 		struct pwm_state state;
> 
> 		/*
> 		 * However without a GPIO driving the display's output
> 		 * enable pin the PWM must emit the inactive level,
> 		 * which isn't guaranteed when calling pwm_disable(), so
> 		 * configure it for duty_cycle = 0.
> 		 */
> 		 pwm_init_state(smd->pwm_vcom_signal, &state);
> 		 state.duty_cycle = 0;
> 		 state.enabled = true;
> 		 pwm_apply_might_sleep(smd->pwm_vcom_signal, &state);
> 	}
> 

Ahh, understood. I looked over the datasheet again. It looks like in the
case where no enable gpio pin is defined we'll need to keep the pwm pulsing
since display hardware would still be enabled.

I'll fix this up in the disable and probe functions.

Best regards,
Alex

