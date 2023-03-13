Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AFAC61DA4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Mar 2023 06:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1420140472;
	Mon, 13 Mar 2023 06:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1420140472
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ZB4sv4JV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v-I8mJUVttzj; Mon, 13 Mar 2023 06:34:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EFD54400FE;
	Mon, 13 Mar 2023 06:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFD54400FE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3B27C0071;
	Mon, 13 Mar 2023 06:34:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB2C4C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Mar 2023 06:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADADA81973
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Mar 2023 06:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADADA81973
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=ZB4sv4JV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4vU_v84Wt63M
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Mar 2023 06:34:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7069A81970
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7069A81970
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Mar 2023 06:34:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 57C0861033;
 Mon, 13 Mar 2023 06:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E566C433D2;
 Mon, 13 Mar 2023 06:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1678689257;
 bh=dfnhwwoUlLciibO9JpPLk0EYzIASM++7YkI5B2eE1Ro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZB4sv4JVe7uy51VYKjUg26KMInXtrae46P7ZJBioVYM139M9utqeBS9K0GH+wH/ES
 XOnQu0eq6e7TKMvEM6Ia4w8s/B8zMO/v+ZhPv0RANjsrRMFRFIOXtyWIk3XBeYHpFK
 KnaM1uiRJNeOCSvp8dnq3aCoxSmMvBwYo4Ey6aIE=
Date: Mon, 13 Mar 2023 07:34:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Subject: Re: [RFC PATCH v1 1/1] linux: mm_types: allow to modified the
 vm_flags in vm_area_struct
Message-ID: <ZA7D54vwYXThZG3U@kroah.com>
References: <20230312224250.425727-1-vincenzopalazzodev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230312224250.425727-1-vincenzopalazzodev@gmail.com>
Cc: david@redhat.com, jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
 Liam.Howlett@oracle.com, jgg@ziepe.ca, willy@infradead.org,
 akpm@linux-foundation.org, linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sun, Mar 12, 2023 at 11:42:50PM +0100, Vincenzo Palazzo wrote:
> With 6.3-rc1 is not possible to build the following drivers
> 
> - nvidia, that the compilation returns the following errors

<snip>

> - vboxhost/7.0.6_OSE where the build fails with the following errors

Out-of-tree code needs to be fixed up all the time, this is their
responsibility, not the kernel's responsibility.  Please submit changes
to their codebases if you rely on these modules.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
