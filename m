Return-Path: <SRS0=KrtX=C6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F91C43463
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Sep 2020 07:49:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AC1720809
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Sep 2020 07:49:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OeEpp92I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AC1720809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DB1F8204FB;
	Mon, 21 Sep 2020 07:49:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hXxVdUmUU0NF; Mon, 21 Sep 2020 07:49:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 31AEC204D9;
	Mon, 21 Sep 2020 07:49:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 170A2C0889;
	Mon, 21 Sep 2020 07:49:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 624C4C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 07:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4BB5E204D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 07:49:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xS7Npn+s75jh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 07:49:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 215B2204CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 07:49:04 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id j2so11795672eds.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 00:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=t+tsRLPb2SEvejhn0HvmhWNe8S705Wa+z+bDjNfQmrM=;
 b=OeEpp92IIkLvk6nWBn4nKCy3wkAwAe3RiLNzfwaw3+tR7TvhLxpfXDaBQCv3E/k7op
 lhDG/XjSlgD25PPHcW/gWeV2pZ80fF4URZrdzq3eqB9STA/ZIZPROnOmbbhDMgv6N+9z
 yvKVYeuhhmugWVihyP9Z5ZsX5ce24YqaheNfW1NEwa+B9oLfrPGQwo79+fJFvZ0hRF3O
 D2nMOLEojqRUZ0HtXEI4UhPQgZIj/ZgqpWwUBqhjtlcLeEBlXl9yXXwyLd0yLzOn3Hf3
 +766wHGJa/PaNUV4DVms8Bhu/yv09wXsdYuNvcUHENDUsGKH+addJaDl1/6rkFM7hhdN
 bMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=t+tsRLPb2SEvejhn0HvmhWNe8S705Wa+z+bDjNfQmrM=;
 b=FZjh5gdrB3B0MtfnucbuhTMINEDmqf86zsNGAqFouqryoIHpewKD4haFqJSOzCw6Vn
 zqd5f9U7n3/RbXzUno2Tcn3hJSn014tu2lBO0yXibczCu8hzQvyy1N5+8MX9ePioEYw/
 tzR3vlM9YJk4+huI+gReYKkxZYP3T4qlW/OO4iCBwAF1pZNIQh1YzwY9WE1Gw8ZAJikI
 jDaF1JecmBMC5EKlXreE6a8P9Hbp7MLW1Efk905aBBGBe6N8UgBSxhvmLXDnb6XRdeE7
 zP/id7SKvoBnbTa/sbPl92XX+235C9rrb+O1D2/dl8o+DDEvB4zriOqg1ucECi86iIlj
 tHSg==
X-Gm-Message-State: AOAM532a6/XmZ+T7fyu6k9ZQonjm12oeYD2kloMPY8rbBLpbXl7l2fNY
 kiBlJBbv+yzHhvGj8Yb0jAw=
X-Google-Smtp-Source: ABdhPJzU1Lzvq6YnN6esUo217Apk/bpjAe4IkibtSr/cryEiT8GkzkpuokezOB1Hj65twKh/bjrlOQ==
X-Received: by 2002:a05:6402:50f:: with SMTP id
 m15mr52912016edv.41.1600674542397; 
 Mon, 21 Sep 2020 00:49:02 -0700 (PDT)
Received: from felia ([2001:16b8:2d52:a400:69ec:6d66:6c4c:48])
 by smtp.gmail.com with ESMTPSA id y9sm8077042edo.37.2020.09.21.00.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 00:49:01 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 21 Sep 2020 09:49:00 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <20200920091706.56276-1-dwaipayanray1@gmail.com>
Message-ID: <alpine.DEB.2.21.2009210940060.7483@felia>
References: <20200920091706.56276-1-dwaipayanray1@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: joe@perches.com, linux-kernel-mentees@lists.linuxfoundation.org,
 apw@canonical.com, linux-kernel@vger.kernel.org
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


Dwaipayan, just a quick nitpick:

Your subject line has two spaces in front of 'From:'

On Sun, 20 Sep 2020, Dwaipayan Ray wrote:

> Checkpatch did not handle cases where the author From: header
> was split into multiple lines. The author identity could not
> be resolved and checkpatch generated a false NO_AUTHOR_SIGN_OFF
> warning.
> 
> A typical example is Commit e33bcbab16d1 ("tee: add support for

You can write 'Commit' lowercase as 'commit'.

> session's client UUID generation"). When checkpatch was run on
> this commit, it displayed:
> 
> "WARNING:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal
> patch author ''"
> 
> This was due to split header lines not being handled properly and
> the author himself wrote in Commit cd2614967d8b ("checkpatch: warn
> if missing author Signed-off-by"):
>

Same here.
 
> "Split From: headers are not fully handled: only the first part
> is compared."
> 
> Support split From: headers by correctly parsing the header
> extension lines. RFC 2822, Section-2.2.3 stated that each extended
> line must start with a WSP character (a space or htab). The solution
> was therefore to concatenate the lines which start with a WSP to
> get the correct long header.
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Link: https://lore.kernel.org/linux-kernel-mentees/f5d8124e54a50480b0a9fa638787bc29b6e09854.camel@perches.com/
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>



On v5.4..v5.7 using data from a previous evaluation, I found 116 commits 
with
the error message "Missing Signed-off-by: line by nominal patch author 
''",
when running ./scripts/checkpatch.pl on v5.9-rc6.


After this patch application, all 116 warnings disappeared with "Missing 
Signed-off-by: line by nominal patch author ''"
and these three new warnings appeared:

322f6a3182d42df18059a89c53b09d33919f755e:35: WARNING: Missing Signed-off-by: line by nominal patch author 'Johnson CH Chen <JohnsonCH.Chen@moxa.com>'
18977008f44c66bdd6d20bb432adf71372589303:37: WARNING: Missing Signed-off-by: line by nominal patch author '"Marek Szyprowski via Linux.Kernel.Org" <m.szyprowski=samsung.com@linux.kernel.org>'
ed3520427f57327f581de0cc28c1c30df08f0103:51: WARNING: Missing Signed-off-by: line by nominal patch author 'Chengguang Xu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>'

With that said, I think am happy to add my tags:

Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Tested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Dwaipayan, you can fix the minor commit message issues above, add the tags 
from Joe and me to the end of your commit message and send the patch as v3 
out to Andrew Morton with everyone sofar as CC. Andrew Morton will pick up 
the patch and make it travel to Linus Torvalds.

Good job so far!

After you did that, let us develop and discuss a plan to refine the 
'trickier' part of false AUTHOR_SIGN_OFF warnings for developer and 
maintainers with some known special author and sign-off procedures.

Lukas

> ---
>  scripts/checkpatch.pl | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 504d2e431c60..9e65d21456f1 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2661,6 +2661,10 @@ sub process {
>  # Check the patch for a From:
>  		if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
>  			$author = $1;
> +			my $curline = $linenr;
> +			while(defined($rawlines[$curline]) && ($rawlines[$curline++] =~ /^[ \t]\s*(.*)/)) {
> +				$author .= $1;
> +			}
>  			$author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
>  			$author =~ s/"//g;
>  			$author = reformat_email($author);
> -- 
> 2.27.0
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
