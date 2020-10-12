Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59B9C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 05:25:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 592032076E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 05:25:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDxHMbyT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 592032076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1065086816;
	Mon, 12 Oct 2020 05:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QXt63nh0K962; Mon, 12 Oct 2020 05:25:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7A8AF867CF;
	Mon, 12 Oct 2020 05:25:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52E97C07FF;
	Mon, 12 Oct 2020 05:25:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8E67C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 05:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AAC92867CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 05:25:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ixPNRY1U7joj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 05:25:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E4CEE867CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 05:25:15 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id t7so13563498ilf.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 22:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oiqSQNufnj1Q0swVe6kKLvVmLoGStYu2mJwHvo0DM4Q=;
 b=WDxHMbyTcZW3Z8bNXhRsf7LPBh3dR+yc2o2Uyou3VWvW1aIo2W4C+yYuQPO3kKO4KM
 tGS+tyu9ANawjgQl9ayZx11TTg15iymyQGVIjFPJXFh6vzy1Er5EU2gLgCX9MhPfz3rV
 hKjYh7SpV3m6w0U2JyosU9CRrC6bR+67/kkBKiQGxUZxBydNSYPV43i3r2KQsfLQHHS9
 9n+akfAl6LO8Th88hbu1XiA90VA1NSHJHQ6n9QRH0ZfqVzQvbn09F4QMg8YgFNay3h1D
 lL1843GYanWVyFtlBf0v4C6tpaXd8ChxldvkkLYzSezFGQG/cO+2VbiHBuBoX/hio2Qp
 oybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oiqSQNufnj1Q0swVe6kKLvVmLoGStYu2mJwHvo0DM4Q=;
 b=D2Y+mqROdVq+ZHcVzr2ZJVs62rmNtppiHKhZV2jiw/2qB6cS46U9rwXrL8au55+PqB
 yNGaf26EBKaYvISDkYLOvA/kM22OV9uLk0TlcmavWqb0KNWf3WQMjWE7fwQjzOyMRETU
 3xsQxtsuTiVIvK0d8opla+fw33Cl5WK1/PbKislffuYdDtqqy/vSmm66GQ7+PlSnjgCw
 qbOSFplopXLJPuKlM99/Yfp6ZL93MxDXGCfZjM2O0G/IoLxl2rWVMZV063sYkxJwIOev
 SvounrxjIDyZ6/3hSINGODzInuUBlPIcVncRhgXI+8mQuR+d+zt8NZn/hMZcVDYefILz
 DoEA==
X-Gm-Message-State: AOAM531IY6u6DX4UFYEah+vxh74XAW93YOzR6lmX6X7G7MoYkj9Wvb9t
 8KYsjSZLoYCuja591nOJFVXq/zjtSkR8al3JrF8=
X-Google-Smtp-Source: ABdhPJzXmcEDAnJBtEwubazXhQxUMXXRHVMQAG1CyPH5/Hxvc8nF5n0U5Sqjz8GpX+FfMilhYWu0arKe15pGt/ls8Oo=
X-Received: by 2002:a92:c946:: with SMTP id i6mr8242148ilq.199.1602480315116; 
 Sun, 11 Oct 2020 22:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201012043611.1189568-1-ujjwalkumar0501@gmail.com>
In-Reply-To: <20201012043611.1189568-1-ujjwalkumar0501@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 12 Oct 2020 07:25:01 +0200
Message-ID: <CAKXUXMxeJddxNam_snrWLucTbUQU+GxqAQ-w+YGvvKBoxt6D2A@mail.gmail.com>
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH] checkpatch: add shebang
	check to EXECUTE_PERMISSIONS
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

Please add linux-kernel@vger.kernel.org (lkml) to the recipient list.

On Mon, Oct 12, 2020 at 6:37 AM Ujjwal Kumar <ujjwalkumar0501@gmail.com> wrote:
>
> checkpatch.pl checks for invalid EXECUTE_PERMISSIONS on source
> files. The script leverages filename extensions and its path in
> the repository to decide whether to allow execute permissions on
> the file or not.
>
> Based on current check conditions, a perl script file having
> execute permissions, without '.pl' extension in its filename
> and not belonging to 'scripts/' directory is reported as ERROR
> which is a false-positive.
>

s/false-positive/false positive/

> Adding a shebang check along with current conditions will make
> the check more generalised and improve checkpatch reports.
> To do so, without breaking the core design decision of checkpatch,
> we can fetch the first line from the patch itself and match it for
> a shebang pattern.
>
> There can be cases where the first line is not part of the patch.
> In that case there may be a false-positive report but in the end we
> will have less false-positives as we will be handling some of the
> unhandled cases.
>
> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
> ---
>  scripts/checkpatch.pl | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index fab38b493cef..e596d30794bf 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1795,6 +1795,23 @@ sub get_stat_here {
>         return $herectx;
>  }
>
> +sub get_shebang {
> +       my ($linenr, $realfile) = @_;
> +       my $rawline = "";
> +       my $shebang = "";
> +
> +       $rawline = raw_line($linenr, 3);
> +       if (defined $rawline &&
> +               $rawline =~ /^\@\@ -\d+(?:,\d+)? \+(\d+)(,(\d+))? \@\@/) {
> +               if (defined $1 && $1 == 1) {
> +                       $shebang = raw_line($linenr, 4);
> +                       $shebang = substr $shebang, 1;
> +               }
> +       }
> +
> +       return $shebang;
> +}
> +
>  sub cat_vet {
>         my ($vet) = @_;
>         my ($res, $coded);
> @@ -2680,7 +2697,9 @@ sub process {
>  # Check for incorrect file permissions
>                 if ($line =~ /^new (file )?mode.*[7531]\d{0,2}$/) {
>                         my $permhere = $here . "FILE: $realfile\n";
> +                       my $shebang = get_shebang($linenr, $realfile);
>                         if ($realfile !~ m@scripts/@ &&
> +                           $shebang !~ /^#!\s*(\/\w)+.*/ &&
>                             $realfile !~ /\.(py|pl|awk|sh)$/) {
>                                 ERROR("EXECUTE_PERMISSIONS",
>                                       "do not set execute permissions for source files\n" . $permhere);
>
> base-commit: d67bc7812221606e1886620a357b13f906814af7
> --
> 2.26.2
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
