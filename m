Return-Path: <SRS0=vND2=43=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FD2C10F27
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Mar 2020 17:34:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7164F21927
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Mar 2020 17:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7164F21927
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B1E2D88F5B;
	Tue, 10 Mar 2020 17:34:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p63smfOIN8v6; Tue, 10 Mar 2020 17:34:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5E1B188E1E;
	Tue, 10 Mar 2020 17:34:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3561DC18D3;
	Tue, 10 Mar 2020 17:34:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33608C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Mar 2020 17:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2224C88665
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Mar 2020 17:34:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SYOXIODm+QeP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Mar 2020 17:34:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1885788610
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Mar 2020 17:34:42 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id F28AF537;
 Tue, 10 Mar 2020 17:34:40 +0000 (UTC)
Date: Tue, 10 Mar 2020 11:34:40 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Pragat Pandya <pragat.pandya@gmail.com>
Message-ID: <20200310113440.43dfe391@lwn.net>
In-Reply-To: <20200303050301.5412-1-pragat.pandya@gmail.com>
References: <20200302114300.34875f69@lwn.net>
 <20200303050301.5412-1-pragat.pandya@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3 0/2] Documentation: Rename two
	txt files to rst
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

On Tue,  3 Mar 2020 10:32:59 +0530
Pragat Pandya <pragat.pandya@gmail.com> wrote:

> This patchset renames following two txt files to rst files and moves
> them to driver-api manual from top level.
>  -io-mapping.txt (Documentation/) -> io-mapping.rst(Documentation/driver-api/)
>  -io_ordering.txt(Documentation/) -> io_ordering.rst(Documentation/driver-api/)
> 
> v2:
>  -Provide more descriptive subject lines.
>  -Move newly generated(rather renamed) rst files to driver-api manual
>   from top level documentation.
> v3:
>  -In v2, the old files were left in place creating new rst files.
>  -Rename the target files rather than simply creating new files.
> 
Both patches applied, thanks.

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
