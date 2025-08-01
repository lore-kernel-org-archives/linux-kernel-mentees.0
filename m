Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5593D2727E6
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  1 Aug 2025 15:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754062052; cv=none; b=ZwXCK0N0vfzrDE46iI/Yx70h7fy4cp0YVP46Gcmp0zkoi3bKVfw4bs1j2+kbeK6QQ8HgIFXMdpD0Jzs7yCKgZ2FXBAdentxPNw85tV2KF5LgubhJ4PhC7nA4+CCQT0iAbuiTMamOGbLSk9BibK20DFn5dcQ0gqaIi3kNXgrlDTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754062052; c=relaxed/simple;
	bh=tPFNf88/PzuSkUeVAm5dy4etBtBV6c4QjPdPYxo9cuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RSuLb+8fUtYiP36RjDX1XlFvC4T1uujqa3ae67t8DzeGOPP9CYNj8Ed1MTUoo5w4kPpM5rhfHoTobnBUgKVnc0vLYvOXawMsAwrJM3Pl8fZVboCxqI73Z3ivkXfuG3OwyF5A05uVNULm0ZDrGr9y4D32KqabMd5oj5PTfEol8ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jma3OEhb; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jma3OEhb"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7170344c100so9848477b3.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 01 Aug 2025 08:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754062050; x=1754666850; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPFNf88/PzuSkUeVAm5dy4etBtBV6c4QjPdPYxo9cuc=;
        b=jma3OEhbmq6DHTOKuzFjEzWBVmYLQYYkeA/lFjZMYy0uuzzi1hmZyDO6k9HP6NVk5J
         QEsQJNbBRDPnLok2XGeoopny8RSNd55zTMbyRB0bpFtV5/j9ue5Vuhy48JXPqO27gNtY
         wjfUZZ2/A2MnLaBkUG2osIQrUVm6M6NVBEnysCiDbr68LXVwIwL0uqBmNLRylvc/2oyE
         pLyVqq4GxTBCzsoR/373Lko/0P1POzWvh0FBmVNXg85sZxYItqa1DkWuIdxLgARjeRDZ
         Mt9mTVafWLfwCgwOq8Op51SrzkIVIEA8FeWKbJi/M9BwNsT9DtvkDluB15doPSpuyDyX
         4AgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754062050; x=1754666850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPFNf88/PzuSkUeVAm5dy4etBtBV6c4QjPdPYxo9cuc=;
        b=sgRrYLyx/fe1jJMItNHmHqE1slf5pfvzBEcpQIBR4fSrNpAKignl7BUV1N1kErMtL0
         TiIMSuvwoyrJS7PlHf/Qf+3HUnjvSCZY9TRn8MrBpBa2UYXksWT6yKLlhP3NbDiAccSS
         dPHKG+jL0fqN01g/TEPa/OTPR35zQo80TSki2HUqCGD8osZPi+ckDZfK5PXhDUCHtTh9
         lxOe+hPsVz1O/pqVGClbSyvEAI8mSFGBp8aOGmL555ABzqCS4JbvUils1y519eXJq06T
         MFOJOLoXzDAwaQPHedaLYL+pSr91Rj8m2FIB8Mg+MthW+Kzd15wsTzZ/JwSVDahZSO06
         tdCg==
X-Forwarded-Encrypted: i=1; AJvYcCWSwTUD6pvcSTgM9pexSs170jko6mrAIOJN3YocMGsG0isKO+9wpkcEGMo5FOuWmk8wVeNbgQED0qeJ/OSJbrnaMMVotw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJGdfx+Qs6KPsAu7VtawiJNn/N2KQVDIRrBKhaIgT9CYrd6Y94
	VsVfg9VIWRVCcp9HX1bBhLHq+pSTmdatP4wk8VmzDLOKfkIYXd5qBN1K/t+CfLkYTrupr3Lr8jn
	XEFEjnnNo3bl/gB54eAUNLm5j8eLL2uw=
X-Gm-Gg: ASbGncuonqJCqOtU5LM017K0qj6xpttprlxNRuTt2k/T7eQxA1gUYoKEwLSWh9tzcvV
	cxQj8l+PEuSEvlaY9P4HIMv3dse6ebD56xEHTOfgArKC0ASRO/vSeQL+vAWWdvcHsQLKNbfN8QA
	x0eScDKtKcQCT/0wHyEDbmAdriflBQOt6RS6UwlS1JidQZKvUlzufZcy3ARZDtElYqyRBRE4Y3F
	Uel9TUb
X-Google-Smtp-Source: AGHT+IGtTnwydBRnNDx1iAloAetjLiySJJ7mxnI12Sn/8rX+pN11KBeKORsT1zOrEsLTa+z+33OXuzmdh2Ph/3TovVo=
X-Received: by 2002:a05:690c:17:b0:71a:1f26:5d1a with SMTP id
 00721157ae682-71b7ed84355mr855347b3.11.1754062050019; Fri, 01 Aug 2025
 08:27:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250626191626.36794-1-moonhee.lee.ca@gmail.com> <c6272a2f-e157-485a-ab16-c3610a969a00@softathome.com>
In-Reply-To: <c6272a2f-e157-485a-ab16-c3610a969a00@softathome.com>
From: Moon Hee Lee <moonhee.lee.ca@gmail.com>
Date: Fri, 1 Aug 2025 08:27:19 -0700
X-Gm-Features: Ac12FXy7UTnL_9RJVqYwWc5gIlHD3mHgBEy5GMm-vXZBqx-aCsd2gBpkALaQ6BA
Message-ID: <CAF3JpA4G4+cHmthLYbXF1sSatQB8SCMe4YUa-kHZwAgAJ2rgtQ@mail.gmail.com>
Subject: Re: [PATCH] selftests: breakpoints: use suspend_stats to reliably
 check suspend success
To: Olivier Blin <olivier.blin@softathome.com>
Cc: shuah@kernel.org, yifei.l.liu@oracle.com, zhujun2@cmss.chinamobile.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Olivier,

On Fri, Aug 1, 2025 at 5:39=E2=80=AFAM Olivier Blin <olivier.blin@softathom=
e.com> wrote:
> Shouldn't you also remove the timerfd variable?
> It seems to be of no functional use after this change.

The timerfd is still required because it provides the wake-up event for
this test. Just before suspend the code programs a CLOCK_BOOTTIME_ALARM
to expire in five seconds. While the system is asleep it needs an
interrupt to resume; this timer supplies it. The patch only changes how
success is checked: we read /sys/power/suspend_stats/success after
resume, instead of comparing time diffs on the timerfd. If the timerfd
were removed, the machine could suspend with no scheduled event to bring
it back, turning the test into a hang rather than yielding a result.

Thanks for the review.

Regards,
Moon
