Return-Path: <SRS0=q8LZ=HR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C6DC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Feb 2021 19:12:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44C35600EF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Feb 2021 19:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44C35600EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 201BD86838;
	Mon, 15 Feb 2021 19:12:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aKrtanxzMZAf; Mon, 15 Feb 2021 19:12:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9F28E867BB;
	Mon, 15 Feb 2021 19:12:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81C81C0174;
	Mon, 15 Feb 2021 19:12:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF5FDC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 19:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BE5F8850A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 19:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4_QFyCAj1JtK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 19:12:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 777FD8501A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 19:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ahBtQ8EQ5jE1I8cSnduD9btkwOgYPHWG4aIuM6PsRWw=; b=fmH7G8QhdVJz+kKx8cQOk4tWIz
 s0ic5Sbo5HA4TEQYNiYJxGtnyLhz1lJfFVc945yY6GQAb9XKNeViIzg8PYNImzKJKpfDkyEo+Qnu5
 o0rUtGu0Wh8TAFZK52W4SLPxAkUaqqmkhkd//wnZNx9ONsgroBfz/m/6lh3Xf/f5SuLKrfkUJBIxQ
 s7qubCBT6YWdQLo/qUrzcjodk0R4WjOdkw/AHbS7BPwsVHCjoBlsu4LsxSJHBoU3O14I4rYgcMEGU
 5u+jb9upjdLpEqyE+Jckwvz2U6qoLeyB2kXd8DcIGbdQNZ6xvngW36ElFHapmwAb1p/P526I115B1
 pmURke2w==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lBjIP-00FxIn-8m; Mon, 15 Feb 2021 19:12:33 +0000
Date: Mon, 15 Feb 2021 19:12:33 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Joe Perches <joe@perches.com>
Message-ID: <20210215191233.GF2858050@casper.infradead.org>
References: <20210213131513.51386-1-dwaipayanray1@gmail.com>
 <20210213131513.51386-3-dwaipayanray1@gmail.com>
 <20210214121501.GC2858050@casper.infradead.org>
 <2162334bdf4d635f1414ffef52378c0f423366a7.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2162334bdf4d635f1414ffef52378c0f423366a7.camel@perches.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC v3 2/3] docs: add
	documentation for checkpatch
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

On Mon, Feb 15, 2021 at 10:11:03AM -0800, Joe Perches wrote:
> On Sun, 2021-02-14 at 12:15 +0000, Matthew Wilcox wrote:
> > On Sat, Feb 13, 2021 at 06:45:12PM +0530, Dwaipayan Ray wrote:
> > > +Checkpatch (scripts/checkpatch.pl) is a perl script which checks for trivial style
> > 
> > It's quite amusing that this patch contains lines > 80 columns.
> 
> Then you could amuse yourself further by looking at the existing
> line lengths of .rst files.

There are good reasons for rst lines to be longer than 80 columns,
but there weren't any in this case.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
