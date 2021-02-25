Return-Path: <SRS0=c32l=H3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF91DC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Feb 2021 17:33:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F10CB64F20
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Feb 2021 17:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F10CB64F20
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98F134EF0D;
	Thu, 25 Feb 2021 17:33:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HqwKVLvCukJg; Thu, 25 Feb 2021 17:33:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id A19DC4EF21;
	Thu, 25 Feb 2021 17:33:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A774C000B;
	Thu, 25 Feb 2021 17:33:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4ECE3C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 17:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30EF46F868
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 17:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id THWlAfzj5-Ex
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 17:33:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay.hostedemail.com (smtprelay0162.hostedemail.com
 [216.40.44.162])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31EF86F865
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 17:33:44 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id A1E62180364DB;
 Thu, 25 Feb 2021 17:33:42 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: view71_120217127693
X-Filterd-Recvd-Size: 3052
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Thu, 25 Feb 2021 17:33:41 +0000 (UTC)
Message-ID: <bcee822d1934772f47702ee257bc735c8f467088.camel@perches.com>
Subject: Re: [PATCH v7 0/2] checkpatch: add verbose mode
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>,  Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Thu, 25 Feb 2021 09:33:40 -0800
In-Reply-To: <20210222075205.19834-1-dwaipayanray1@gmail.com>
References: <20210222075205.19834-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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

On Mon, 2021-02-22 at 13:22 +0530, Dwaipayan Ray wrote:
> Add a new verbose mode to checkpatch. The verbose test
> descriptions are read from the checkpatch documentation
> file at `Documentation/dev-tools/checkpatch.rst`.
> =

> The verbose mode is optional and can be enabled by the
> flag -v or --verbose.
> =

> The documentation file is only parsed by checkpatch.pl
> if the verbose mode is enabled. The verbose mode can
> not be used together with the --terse option.

I don't have any real objection to this patch set, but as this
might be added to the Documentation tree and in .rst format,
perhaps Jonathan Corbet and/or Mauro Carvalho Chehab might have
some opinion.

Also I do not want to be a maintainer of this .rst file and
likely neither Jon nor Mauro would either.  Perhaps you?

Ideally, the patch order would be reversed so the .rst file
is added first, then checkpatch updated to use it.

And _a lot_ more types and descriptive content should be added.

> =

> Changes in v7:
> - Add color coding support to --list-types option
> =

> Changes in v6:
> - Allow using verbose mode with --list-types option
> =

> Changes in v5:
> - Change the reference format to use absolute links.
> - Print verbose descriptions only for the first time
> =A0=A0a message type is encountered.
> =

> Changes in v4:
> - Change the type description format
> - Group the message types by usage
> - Make handling of --terse with --verbose simpler
> =

> Changes in v3:
> - Simplify documentation file parsing in checkpatch
> - Document a total of 33 message types for checkpatch
> =

> Changes in v2:
> - Use .rst Field Lists to specify the type descriptions.
> - Add a few more type descriptions to documentation.
> =

> Dwaipayan Ray (2):
> =A0=A0checkpatch: add verbose mode
> =A0=A0docs: add documentation for checkpatch
> =

> =A0Documentation/dev-tools/checkpatch.rst | 525 +++++++++++++++++++++++++
> =A0Documentation/dev-tools/index.rst      |   1 +
> =A0scripts/checkpatch.pl                  | 133 ++++++-
> =A03 files changed, 639 insertions(+), 20 deletions(-)
> =A0create mode 100644 Documentation/dev-tools/checkpatch.rst
> =



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
