Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E4DC4167D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Oct 2023 12:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4BEC41760;
	Tue, 31 Oct 2023 12:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4BEC41760
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=F/PbD1qC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZM0W6dtEJSFZ; Tue, 31 Oct 2023 12:20:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7B65D4047B;
	Tue, 31 Oct 2023 12:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B65D4047B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3CEC5C0039;
	Tue, 31 Oct 2023 12:20:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93CF6C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 12:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EAD282CCB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 12:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EAD282CCB
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=F/PbD1qC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qVUjpCoWIE_5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 12:20:33 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F35082BED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 12:20:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F35082BED
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C1870CE09B1;
 Tue, 31 Oct 2023 12:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B11C433C7;
 Tue, 31 Oct 2023 12:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1698754828;
 bh=yI9cIfjDH0p+ULOykOKr6PiIJjrMLZUkCkzDvV4S17A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F/PbD1qChBUcGOzVjCdP50zTg+0CzyiNe7xs7hlIkMO8lEikHuPOO3vEdSXX5Kj8h
 u1hUAEb5Ja5KG815zFuBi7QzNpoz/Uccm1sO74Qa9n65tz0ehnGHfGGXJysa7vXLYr
 atPnpm9IqDu3+G0BD0q+48ya4E73jCDl8I36kOBc=
Date: Tue, 31 Oct 2023 13:20:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Jos=E9?= Pekkarinen <jose.pekkarinen@foxhound.fi>
Subject: Re: [PATCH] drm/amd/display: remove redundant check
Message-ID: <2023103141-clear-scale-897a@gregkh>
References: <20231030171748.35482-1-jose.pekkarinen@foxhound.fi>
 <2023103115-obstruct-smudgy-6cc6@gregkh>
 <3ab58c1e48447798d7525e7d2f42f1a2@foxhound.fi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ab58c1e48447798d7525e7d2f42f1a2@foxhound.fi>
Cc: dillon.varone@amd.com, george.shen@amd.com, sunpeng.li@amd.com,
 linux-kernel-mentees@lists.linuxfoundation.org, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 aurabindo.pillai@amd.com, samson.tam@amd.com, daniel@ffwll.ch,
 SyedSaaem.Rizvi@amd.com, stable@vger.kernel.org, airlied@gmail.com,
 Jun.Lei@amd.com, harry.wentland@amd.com, christian.koenig@amd.com
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Oct 31, 2023 at 01:42:17PM +0200, Jos=E9 Pekkarinen wrote:
> On 2023-10-31 07:48, Greg KH wrote:
> > On Mon, Oct 30, 2023 at 07:17:48PM +0200, Jos=E9 Pekkarinen wrote:
> > > This patch addresses the following warning spotted by
> > > using coccinelle where the case checked does the same
> > > than the else case.
> > > =

> > > drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c:4=
664:8-10:
> > > WARNING: possible condition with no effect (if =3D=3D else)
> > > =

> > > Fixes: 974ce181 ("drm/amd/display: Add check for PState change in
> > > DCN32")
> > > =

> > > Cc: stable@vger.kernel.org
> > =

> > Why is this relevant for stable?
> =

>     Hi,
> =

>     I was asked to send it for stable because this code
> looks different in amd-staging-drm-next, see here.
> =

> https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/dr=
ivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c#L4661

I don't know what I am looking at, sorry.

>     Feel free to let me know if this is wrong, or if I
> need to review some other guidelines I may have missed.

Please see the list of rules for stable patches:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

Does "remove code that does nothing" fit here?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
