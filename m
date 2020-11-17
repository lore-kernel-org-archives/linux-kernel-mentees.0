Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4557C5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 07:22:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15D35246E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 07:22:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="WfYfJ93D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15D35246E0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7A65186523;
	Tue, 17 Nov 2020 07:22:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x3w2bcGpD18k; Tue, 17 Nov 2020 07:22:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0B30285BBD;
	Tue, 17 Nov 2020 07:22:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 031B1C0800;
	Tue, 17 Nov 2020 07:22:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C89AC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 07:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4A30285DDC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 07:22:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BwcM8s-wzh-F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 07:22:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 76A3085DCA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 07:22:49 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id l11so16653154lfg.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 23:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W4i9NQ6OsoFN+e3Rm0o5pJgxWmU5+u//PeH5iAlvI+Q=;
 b=WfYfJ93D2b8j/Ccxn/+u4A+b7M0oMztWQkICt8e/T2MyRer7AGAAZ8bcl/iScxkC10
 zbPD91sa/oGENgF8pCuiVYmsHN3/lrQIKzqM/aG0A5sSb4yw0XAVcnzaLjNwxFXCYq1u
 jdtX0Jt/GfV1ihXGwMbOV+f1omfzXxlRDGWGI+a8gfOq+BrD2OgqZZeTW7OAeQSW9ekE
 ZixbcRj0ZqSBfa6lYDt2LPFq6jHbtW/8bePoSvE5Wgacuz2XKsXCEpf7LlA+1MmHDBYg
 A0qPJviPSleIQa2o/nDYmYsif6kFgz8uPgz1VNrEbS7bN9jwR7IeGwnYfrNK/WAkuT33
 4i2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W4i9NQ6OsoFN+e3Rm0o5pJgxWmU5+u//PeH5iAlvI+Q=;
 b=OzMFuh6nHTXxe+Rb9MpKkf1AcUjKDse30vYKIx9XAjWsZ+Z+t/sVt2G+CFSJWvFPuC
 /VX4L5bATK7VwKQgGbEfHzDnhSzhKk4UfaL7EFdDBhIQpinVLugUwvvdTn1pWEIymMYX
 IrfSUIbEzTj4yV7jUuaTTDdbw4mZP3hb0T+8ji8fsvuQN9X3arkKCc78xh6ofvvqWU1l
 ErhUkFikHXJq5sG45JHL5b32xvIDrUgYycd98QRUwNT+wHciu3QTtPJseQxMYh+kJ+sX
 +8bM4PWX7koy96eJrrBjrXCnD/rssnA6yhN6JCWNe6TwoRIRdQwD4FVGootwRLEJuQnj
 6raw==
X-Gm-Message-State: AOAM530+xUFAoIXqU4h8ey0L3VaesyP1gGiO5AyccyNfriTgqY+v0XH6
 A2Sx+ILaXudGBwJSfrCOu9GCFcaBmvS0/WFXZ5DDZA==
X-Google-Smtp-Source: ABdhPJwO/2yfXmZ1Vt+DpDaiiQD3/ihK5JLFFsvm+jmuo6EweYkqBMdWs0coZNIQajHnfl8gDcLNZBNL9t49PS/n6RI=
X-Received: by 2002:a19:4bc2:: with SMTP id y185mr1104940lfa.243.1605597767312; 
 Mon, 16 Nov 2020 23:22:47 -0800 (PST)
MIME-Version: 1.0
References: <20201116054035.211498-1-98.arpi@gmail.com>
 <20201116054150.211562-1-98.arpi@gmail.com>
In-Reply-To: <20201116054150.211562-1-98.arpi@gmail.com>
Date: Tue, 17 Nov 2020 15:22:35 +0800
Message-ID: <CABVgOSmgf3WzYge79LwnJ0QWjZ37AASNJJZ7KV7BX2d++-7_QA@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: Marco Elver <elver@google.com>, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, "Bird, Tim" <Tim.Bird@sony.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v9 2/2] fs: ext4: Modify
 inode-test.c to use KUnit parameterized testing feature
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
From: David Gow via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: David Gow <davidgow@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Mon, Nov 16, 2020 at 1:42 PM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
>
> Modify fs/ext4/inode-test.c to use the parameterized testing
> feature of KUnit.
>
> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
[Resending this because the HTML-email demon struck again! Sorry for the mess!]


Thanks: this is working well over here.
The only (minor) issue I've noticed is that the diagnostic output is
too big for the default log buffer if debugfs output is used, causing
some of the messages to be dropped from the debugfs results file. But
that's clearly not an issue with this patch, and the actual combined
result is still present (and the complete results should show up in
dmesg anyway).

Tested-by: David Gow <davidgow@google.com>
Reviewed-by: David Gow <davidgow@google.com>

Thanks!
-- David
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
