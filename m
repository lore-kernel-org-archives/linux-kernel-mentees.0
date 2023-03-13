Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDBAC7618B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Mar 2023 09:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C959400E4;
	Mon, 13 Mar 2023 09:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C959400E4
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=IlKbUZTE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3MyfetuEtNyo; Mon, 13 Mar 2023 09:50:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5A20240556;
	Mon, 13 Mar 2023 09:50:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A20240556
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30A5EC0071;
	Mon, 13 Mar 2023 09:50:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4DEABC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Mar 2023 09:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22F7D8169B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Mar 2023 09:50:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22F7D8169B
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=IlKbUZTE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pBhCgBrhgST1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Mar 2023 09:50:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85C9581551
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85C9581551
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Mar 2023 09:50:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5E8786118A;
 Mon, 13 Mar 2023 09:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD09C433D2;
 Mon, 13 Mar 2023 09:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1678701049;
 bh=GMpaLnOqXb+7MPkHeMOKZKNyvoOvPhAmgpt/cCCapG4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IlKbUZTEfaWxHP6cZkwLsDTXGNL3BXy7K86TuZ25hVU7t44PnNf+2Eplg+Ys7L2hc
 un8IrYMbyS29LC1JTQaiL3LLbvPhsFqIvlqX+HBNVhBkOEiaIYIBYqLh+IiH8JTEKM
 ugvtGLUPSuiaHpstiWhgD/FRR5b5KhI8FovbBwzU=
Date: Mon, 13 Mar 2023 10:50:47 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Subject: Re: [RFC PATCH v1 1/1] linux: mm_types: allow to modified the
 vm_flags in vm_area_struct
Message-ID: <ZA7x9y60sfGOanHl@kroah.com>
References: <20230312224250.425727-1-vincenzopalazzodev@gmail.com>
 <20230312175703.d8d8e0192387dfa9592ee8e5@linux-foundation.org>
 <CR55BD4YCDR1.22R5TLYJW6YS0@vincent-arch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CR55BD4YCDR1.22R5TLYJW6YS0@vincent-arch>
Cc: david@redhat.com, jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
 willy@infradead.org, jgg@ziepe.ca, Liam.Howlett@oracle.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Mon, Mar 13, 2023 at 10:25:19AM +0100, Vincenzo Palazzo wrote:
> P.S: regaring the warning at compile time the __deprecated looks a good
> fit to generate error message, but to me in this particular case do not.

__deprecated does not work in the kernel tree, sorry.  We have tried
that in the past and it just gets ignored.  Instead, we fix up all
in-kernel users and continue on.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
