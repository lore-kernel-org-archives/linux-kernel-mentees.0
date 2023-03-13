Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC2DC6FD19
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Mar 2023 01:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28EC560D95;
	Mon, 13 Mar 2023 01:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28EC560D95
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=gfrtTYAX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NU2G1DQO3ndI; Mon, 13 Mar 2023 01:12:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0D64160D9D;
	Mon, 13 Mar 2023 01:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D64160D9D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE274C0035;
	Mon, 13 Mar 2023 01:12:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74343C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Mar 2023 01:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 504EC40103
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Mar 2023 01:12:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 504EC40103
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux-foundation.org
 header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg
 header.b=gfrtTYAX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MSeK6TgISB69
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Mar 2023 01:12:32 +0000 (UTC)
X-Greylist: delayed 00:15:26 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9ECDF400FE
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9ECDF400FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Mar 2023 01:12:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AC30D60F83;
 Mon, 13 Mar 2023 00:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14A9C433EF;
 Mon, 13 Mar 2023 00:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1678669025;
 bh=wHbqt1J/XtYJxxxsTQgzmD4WRRmmCjsOMfI8qYGXybo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gfrtTYAX2BZ1JuQYHpXWmAL2kRpaBSXSCs4sgTFYpl37KyWv6nJj/Ww2jxX0JFIai
 18lo3QY/C2pNXUq0dACdaJt5T5IOuRfINjtwfLdDyHbs9oYMgLqFhxxc4juXPU/njd
 QnRw8ZTYM9vrCxCZtZW0pF88BH9AYO3idA1qfmM4=
Date: Sun, 12 Mar 2023 17:57:03 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Subject: Re: [RFC PATCH v1 1/1] linux: mm_types: allow to modified the
 vm_flags in vm_area_struct
Message-Id: <20230312175703.d8d8e0192387dfa9592ee8e5@linux-foundation.org>
In-Reply-To: <20230312224250.425727-1-vincenzopalazzodev@gmail.com>
References: <20230312224250.425727-1-vincenzopalazzodev@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: david@redhat.com, jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
 willy@infradead.org, Suren Baghdasaryan <surenb@google.com>, jgg@ziepe.ca,
 Liam.Howlett@Oracle.com, linux-kernel-mentees@lists.linuxfoundation.org
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

On Sun, 12 Mar 2023 23:42:50 +0100 Vincenzo Palazzo <vincenzopalazzodev@gmail.com> wrote:

> With 6.3-rc1 is not possible to build the following drivers

Well, let's cc Suren who actually wrote bc292ab00f6c ("mm: introduce
vma->vm_flags wrapper functions").

> - nvidia, that the compilation returns the following errors
> 
> - vboxhost/7.0.6_OSE where the build fails with the following errors
> 
> ...
>
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -497,7 +497,7 @@ struct vm_area_struct {
>  	 * To modify use vm_flags_{init|reset|set|clear|mod} functions.
>  	 */
>  	union {
> -		const vm_flags_t vm_flags;
> +		vm_flags_t vm_flags;
>  		vm_flags_t __private __vm_flags;
>  	};

These out-of-tree drivers should be converted to use the wrappers which
bc292ab00f6c added.  Their maintainers have a couple of months to do
this before bc292ab00f6c is released in 6.3.

It's unfortunate.  I guess it would be better if we were to find a way
to permit these drivers to compile OK but to generate warnings, as an
interim thing for six months or so.  Perhaps there's some clever way.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
