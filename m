Return-Path: <SRS0=DonT=C4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66807C43463
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 21:15:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E110E207FF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 21:15:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XvNw62vZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E110E207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9ACEF871A2;
	Sat, 19 Sep 2020 21:15:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2DOYPBLaCb90; Sat, 19 Sep 2020 21:15:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7C7AC8717D;
	Sat, 19 Sep 2020 21:15:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6FA2BC0859;
	Sat, 19 Sep 2020 21:15:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30FD1C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 21:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1941B870FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 21:15:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K+ZBjZLSH22y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 21:15:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B586786B95
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 21:15:29 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 60so8830008otw.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 14:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4NE92dLWxMPaSeatfewwbxHnRL0hULQOCCKMXN6uTbo=;
 b=XvNw62vZDc9nqXARbNuPp/a8Ks1ZvzpfjbvUj+bSdSqbDR6v+VeS5PWz3ZXhvTAKGB
 HuNsCiJ7hFU2i/8lxxE3ph+dVJzTUTgMaehs9ovVLkra1L2QogNMQdETrBpnbiNnOVzG
 pYWdYt8WT9e+b1hQhmkc1NcFfqDH9QJBq5/aj7/z3j5IERn7iW7miT4o/Eywenj/9aiU
 Y0a0Gv+S7Q6xDIle1ayFjlWXnQ9p8RQEfyv5fOW0OGpeW+60y2nkIAPRAO4vJ6IKmYF8
 1AQ0vFk84WGE1+u2FTQcdIL4fxj6KELCMG4I6cTt+oCctGvgx/3IjAXisG6YdkNnKXfb
 YC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4NE92dLWxMPaSeatfewwbxHnRL0hULQOCCKMXN6uTbo=;
 b=l7RhsBZsRfUpaZU73D91tWyucVfbsd7Y4Uh0cMg2PyFmdFRNafjF1ORRZNmUQ0cGCm
 Z4/kMaPNrM7OUvfQH0iUBj3B1dL5udZ4Ng647DxCGuFKOhCTS9/AsBZktLJCIB4AHh6m
 KqzZ3Fso0ZOcuY0gRgFsDK0e/lht2KhUeHL9q7DxPZfIfx5e5bEgoNJQ3nC6o2G9CR35
 cVtRVsJsa1wsvOB5By6tlN77vaIXv5AXvtMnuf8ps+dInvI/1J4OxpLElJWjlsLISK4M
 yYKznBYSKS0UGcocjfowOqVlroUoJxVRu+EKowek9cywXkiB9ZBWwKgyw+5QAV0CgrDD
 gJYg==
X-Gm-Message-State: AOAM532S1pGqyLhnc1Gl5gb9uniDWa79kxhVn52LJAW+5UPl9l5/x6kk
 Da6krNf0ZXI0vUmk+3tFqv24k7QUzvP6KGg6bJs=
X-Google-Smtp-Source: ABdhPJws+K+LDJilYNTQ3o6GVj7PW0KKJF2s9jfvMKCEBv967q9Ygu54wMfEX4Oe1Te6aMVaJMZ8CTVXC4zPr9svcgI=
X-Received: by 2002:a9d:8f2:: with SMTP id 105mr23487012otf.215.1600550128731; 
 Sat, 19 Sep 2020 14:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200919204721.100531-1-dwaipayanray1@gmail.com>
In-Reply-To: <20200919204721.100531-1-dwaipayanray1@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 20 Sep 2020 02:45:09 +0530
Message-ID: <CABJPP5Abo1qzO+G=SEzhCLGwoiH+hgicDMy3gMmSwKBvOQcn8A@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: extend author
 Signed-off-by check for split From: header
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

On Sun, Sep 20, 2020 at 2:18 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> Checkpatch did not handle cases where the author From: header
> was split into multiple lines. The author identity could not
> be resolved and checkpatch generated a false NO_AUTHOR_SIGN_OFF
> warning.
>
> Support split From: headers in AUTHOR_SIGN_OFF check by correctly
> parsing the entire From: header in such cases.
>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 504d2e431c60..8ee61ec346b3 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2661,6 +2661,10 @@ sub process {
>  # Check the patch for a From:
>                 if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
>                         $author = $1;
> +                       my $curline = $linenr-1;
> +                       while(defined($rawlines[++$curline]) && ($rawlines[$curline] =~ /^\s+(.*)/)) {
> +                               $author.= $1;
> +                       }
>                         $author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
>                         $author =~ s/"//g;
>                         $author = reformat_email($author);
> --
> 2.27.0
>

Hi,
Based on Joe's suggestions I updated the patch. It's totally similar
except for the fact that Joe missed a closing parenthesis and
he removed the decode("MIME-Header") part which caused parsing
of utf-8 to fail.

example: (commit e33bcbab16d1)
WARNING: Missing Signed-off-by: line by nominal patch author
'"=?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?="
<vesa.jaaskelainen@vaisala.com>

So I fixed these.

Also, Joe stated that all split lines must start with a space. But I
looked it up and it states that it must be a WSP, that is either a
single space or a horizontal tab.
References:
WSP: (https://www.rfc-editor.org/std/std68.txt)
Long headers: https://tools.ietf.org/html/rfc2822#section-2.2.3

So, i went with the ^\s+ expression instead of ^ s*. Is it alright
or should be changed?

I do have a final question though, since he had already solved it,
is it okay to send this patch in again?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
