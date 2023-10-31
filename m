Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1D0C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Oct 2023 05:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E133682499;
	Tue, 31 Oct 2023 05:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E133682499
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rl2xXr8n
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EqjgAdocNpkX; Tue, 31 Oct 2023 05:48:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AC24282486;
	Tue, 31 Oct 2023 05:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC24282486
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94B6EC0071;
	Tue, 31 Oct 2023 05:48:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59DF8C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 05:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 339CD401A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 05:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 339CD401A4
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=rl2xXr8n
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hd8uk0i-aVg8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 05:48:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DD7F4013D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 05:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DD7F4013D
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EA3C360C2C;
 Tue, 31 Oct 2023 05:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14AB9C433CA;
 Tue, 31 Oct 2023 05:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1698731312;
 bh=ZL86179SQNnH59nO9ZdsjOEwSLJlQ/T8PyWZqwTE7cg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rl2xXr8n+alSL/G+gmf7W7osy2QKqZ/XO2v0vxwyI1mgZzbPlnmeavVHcWzMVQTZ1
 boFAFoTtuz/nV6SJ49p0TSyf5SsSQw7rXf6Zg/6xhbAXqvDQ3vZmkQoBlUkRDkSHkK
 2GyYv5I7h6c3ZBh+IWHlOc42jk8oRV4ESdsAIcA8=
Date: Tue, 31 Oct 2023 06:48:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Jos=E9?= Pekkarinen <jose.pekkarinen@foxhound.fi>
Subject: Re: [PATCH] drm/amd/display: remove redundant check
Message-ID: <2023103115-obstruct-smudgy-6cc6@gregkh>
References: <20231030171748.35482-1-jose.pekkarinen@foxhound.fi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231030171748.35482-1-jose.pekkarinen@foxhound.fi>
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

On Mon, Oct 30, 2023 at 07:17:48PM +0200, Jos=E9 Pekkarinen wrote:
> This patch addresses the following warning spotted by
> using coccinelle where the case checked does the same
> than the else case.
> =

> drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c:4664:=
8-10: WARNING: possible condition with no effect (if =3D=3D else)
> =

> Fixes: 974ce181 ("drm/amd/display: Add check for PState change in DCN32")
> =

> Cc: stable@vger.kernel.org

Why is this relevant for stable?

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
