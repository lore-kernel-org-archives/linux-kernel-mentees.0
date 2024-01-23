Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F047B81AB2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Jan 2024 18:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706033251; cv=none; b=HpNmEzlqw/+T3Bolk43oYTGIvHAFDyglRyBakPHzaeF8y2y6DfXZb1VReOoTggngWYP07VJa+wtbMuSSukog8ZFbYtRvVe1wh3+Aw5mdSp0Yr3NdJJbADrtuj3CNXJJIVtJO3qTl7G8OTWfXdGaXnUS4Srbxm4a7fEZE3f/Hkns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706033251; c=relaxed/simple;
	bh=+OV+H5D7tbv3ry8nCEWMApbZiBpABb3yJc66FoBBZuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4jVwStZ4BW0eKYOqVzecf3HJEU2sUTnNoza84q11jMOnMyW4ONgh39DSzbbJHBkVc6OfXlcTFgrYjKC2d1JOXNyuvw1gUQnXjPwa78+ayZc++0s8LfTvY3uoa/hyyIzrSwcff0gck+DwKAsSchi/wWABFsJaEEqiEo8RLLPC60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QMLIZ/1J; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QMLIZ/1J"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79393607F7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Jan 2024 18:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79393607F7
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=QMLIZ/1J
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IN8vkZFjeFLD
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 23 Jan 2024 18:07:29 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D9DF5607F1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Jan 2024 18:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9DF5607F1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B578D61EB6;
	Tue, 23 Jan 2024 18:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15D09C43399;
	Tue, 23 Jan 2024 18:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706033247;
	bh=+OV+H5D7tbv3ry8nCEWMApbZiBpABb3yJc66FoBBZuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMLIZ/1JmtG6fRR0czJTDNEHiuQ2TsgWHe/dVW4/Q+9TgkUUsL50iMed5fd0KZM47
	 PsGpVlUJ+Czs/4ghNZpMV5aKBKUd2FUCPW2t3mWc0bm4FdVngGeg7Lm0xVOgbjYB8A
	 Zrozbp6EuGxZveTfZyYUcHS77/rLFxta4IcqsULc=
Date: Tue, 23 Jan 2024 10:07:23 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: vivek yadav <vivekyadav1207731111@gmail.com>
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] Add Extra kernel Version
Message-ID: <2024012336-abridge-glaring-82dd@gregkh>
References: <20240123165838.2110-1-vivekyadav1207731111@gmail.com>
 <2024012329-manor-entrench-3048@gregkh>
 <CABPSWR5duFjFqR=M9idahqRJR-UuvSqFPnyMs6ckr3EFyFON1A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABPSWR5duFjFqR=M9idahqRJR-UuvSqFPnyMs6ckr3EFyFON1A@mail.gmail.com>

On Tue, Jan 23, 2024 at 11:15:42PM +0530, vivek yadav wrote:
> Hi Greg KH,
> 
> As part of mentorship program activity *"Extra kernel Version"*, I need to
> send this patch to* skan@linuxfoundation.org <skan@linuxfoundation.org>.*
> But I read in *LFD103 beginner guide *that we can send patches to*
> linux-kernel-mentees@lists.linuxfoundation.org
> <linux-kernel-mentees@lists.linuxfoundation.org> also.*
> Due to this reason I send it in public mailing list.
> 
> If I did something wrong. Please let me know. I am new to this.

I think for "real" patches to the kernel that you want accepted, yes,
use the mentees list.  But for the "application process", those have
never been sent here before from what I can tell.

thanks,

greg k-h
