Return-Path: <SRS0=vsPk=74=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF21AC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Jun 2020 18:44:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 916992071A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Jun 2020 18:44:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qq3fN4y2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 916992071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6974A887A7;
	Mon, 15 Jun 2020 18:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id StTfKY1r87PH; Mon, 15 Jun 2020 18:44:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EB25A87FFB;
	Mon, 15 Jun 2020 18:44:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1781C0888;
	Mon, 15 Jun 2020 18:44:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AB34DC016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 18:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9698288222
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 18:44:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oo1OtwDSylkH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 18:44:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 29A1E87FFB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 18:44:08 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 10so8182484pfx.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 11:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/L9vpEy4YW+wvyzUDXXcVOqQeUfP4Lan/mDToAVsZn8=;
 b=Qq3fN4y2CCfEPhibQkPDaZ75Ak5kNzodLN5Z3DKP2Bq96Tm1pExOLtH5IRqg3V67wN
 7KpKNhSUNdpTUyhFuzRc5jhgaJ8fabzwM7yYceZFF/SrROtrUgG07+eLCcFy32D6+U/3
 NmQEkdKxfiGBRWeC0hEo70hvO4o/6uQ/AETGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/L9vpEy4YW+wvyzUDXXcVOqQeUfP4Lan/mDToAVsZn8=;
 b=jPSkF5I4MyQPQuILKEsid7GmHajpO44QMPNJl+ZH/JC+J/jvsmAci1Igo/FABCuQsi
 hTf5iYp6ifPDpfziaz5LM/i+EyN+2SXB8xLskxo4yKUXfcZJacYt6LpPjqB1di8YwcNS
 sQ/hozY9LfnDi5Sk8MYHFsHsjp3vT3iev5bJDoYgP5zv2HOzkz4trzoVy7OKgWa7nRy5
 Pivl+ycybCU+yKu+O+6xQ/J5lHpnU6paBDA5w0JgbxQJ4YwedY0CoWCd0GMcx0IjqJFV
 1MvsQoZv0Gx06iLteh7KsbOrusXMcTmm/YUZgPaxdVRNzFqdbqFU8GifXdqMkNO3zRB1
 qQ1A==
X-Gm-Message-State: AOAM531ASLJmEk+FpSVjWVgpmw1zAtGLDSiECjS4a1oAJ4UF2s+9Y72N
 ufOF113tCOdszVVuRjUnu3lbLQ==
X-Google-Smtp-Source: ABdhPJz0GnEMgd+NOJZ4YyIuSQqz2DIY7a1WO/6cybe4V5xreJTkji7NSBD9m9gfN0gcNG2/5EgGBg==
X-Received: by 2002:a63:2a8a:: with SMTP id
 q132mr21651876pgq.279.1592246647773; 
 Mon, 15 Jun 2020 11:44:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l4sm12552670pgo.92.2020.06.15.11.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 11:44:06 -0700 (PDT)
Date: Mon, 15 Jun 2020 11:44:06 -0700
From: Kees Cook <keescook@chromium.org>
To: "Bird, Tim" <Tim.Bird@sony.com>
Message-ID: <202006151142.8B78AAE7D2@keescook>
References: <CY4PR13MB1175B804E31E502221BC8163FD830@CY4PR13MB1175.namprd13.prod.outlook.com>
 <202006141050.5512F17@keescook>
 <CY4PR13MB11752A5C1586F3D597C52679FD9C0@CY4PR13MB1175.namprd13.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR13MB11752A5C1586F3D597C52679FD9C0@CY4PR13MB1175.namprd13.prod.outlook.com>
Cc: David Gow <davidgow@google.com>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] RFC - kernel selftest result
	documentation (KTAP)
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

On Mon, Jun 15, 2020 at 05:45:28PM +0000, Bird, Tim wrote:
> Personally, as a human I find the space prefix a bit easier to read.
> However, I think that in "normal" kernel log output it is unusual for
> a line to be prefixed with a hash (#), so this might be easier to
> both visually distinguish and for automated parsing.
> So I'm torn.  I don't have a strong opinion on space vs. hash prefix
> for indicating sub-test.  I think the KUnit convention of matching
> whatever was the prefix of the "TAP version 14" line is clever, but
> it would be nice to just pick a prefix and be done with it.

Are there plans in kernelci for doing any parsing of subtests? (As in,
what do we break if we move from "# " to "  "?)

I'm really thinking "  " makes sense now. :)

-- 
Kees Cook
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
