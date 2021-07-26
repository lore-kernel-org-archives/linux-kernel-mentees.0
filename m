Return-Path: <SRS0=f8HV=MS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FEF8C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Jul 2021 10:41:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A7C160F22
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Jul 2021 10:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A7C160F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9CE8401F2;
	Mon, 26 Jul 2021 10:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Zim2P3Ud9dJ; Mon, 26 Jul 2021 10:41:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2A1764010E;
	Mon, 26 Jul 2021 10:41:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF322C0010;
	Mon, 26 Jul 2021 10:41:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17111C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 10:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4F20401EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 10:41:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Cc0j_FUu9sI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 10:41:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB8FF401E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 10:41:00 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id x192so14144868ybe.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 03:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/BY0mcjiV9qhKqB6/+jGLmOcn7PesrCXdkGRSyP9yso=;
 b=i3UhBiQ5kJWBY6uHfrd6tvUNbEbxwMfOqrS04n3y6cf3Cp5Qm8Z6XuEuCyA25AmV5z
 KWbF+R8PvH8aO8/iA8OmYBALw8sTjZ78hdYgfvc+qOkXBzYr3NdiFSv+BQsc8jVx6Fc7
 AADnw/7J62hulH0OM5gyt56OrjVoVilzfQMI9dr2o1yefQFpyYASf6uRJue4RXVSuJlp
 G7Px+FNKRGk7FVhY7mFqPgdGZmf5hBdGRBWQZeqaMwClV+px/nV0Us3758neG/gXAmP8
 oCD3iApUT3+E5/StcUJsCJks8FLqRnpWnNSojQ8Fa7S99NowoF9nPJfJBKvvhKFOjNzJ
 +SXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/BY0mcjiV9qhKqB6/+jGLmOcn7PesrCXdkGRSyP9yso=;
 b=I0ZflVV2edehf04zrFI9PQTOKuL1P4eSXFl5mFfGJGhwPnELm1vSXXdRaVMhIiPUlA
 4frVV0gQYi8AWZPYFUO6hmUxQr+uTPekXXES/rgmhvS18S+goDGgz4/cg06JKnreQSXv
 m4jArR5Sx+O7S4QbyHvRAxRLJpxaA91l6y01RWWP6RuWpDdrCGhT8+jMYSlXPyY4JQPa
 e45m5sE2YoFrkJW5/SW9XkWWRMvgygvsaovksDhMl+lEVFWVz0/p7TcZw2Z9RDa6BTlZ
 N24zKIc61wZZ2cp0kYI4NTmST4SQ6+em+bKT3zuGUwF1zT/gwQKWNoyobPUA5AhZa30z
 615w==
X-Gm-Message-State: AOAM530jmtAog+sGTiOYvE9cLcQ7xnnWHHmaaDRpinKGvtcTN3aF0uJb
 8hlMawdCCL+d617Y48fIGbkVrklGr3ZJlOQ3Vuc=
X-Google-Smtp-Source: ABdhPJy5PewDi064X7pKqyk4FmjLN4TMLPEBe2z6rmGCUt574MnM8LeuIZAV3CC4HVxSVOUCeiGfQtjl96Gr/xZ3Nr8=
X-Received: by 2002:a25:842:: with SMTP id 63mr22390966ybi.518.1627296059570; 
 Mon, 26 Jul 2021 03:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210717064653.GA4873@uver-laptop>
 <CAKXUXMwTs=JoMUFaigLsUmnG3XTs3B1NF+VTsYcQYgTSygWXVA@mail.gmail.com>
 <20210724220630.GA11748@uver-laptop>
In-Reply-To: <20210724220630.GA11748@uver-laptop>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 26 Jul 2021 12:40:48 +0200
Message-ID: <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
Subject: Re: Linux Kernel: Checkpatch Documentation Mentorship Tasks
To: Utkarsh Verma <utkarshverma294@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
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

On Sun, Jul 25, 2021 at 12:06 AM Utkarsh Verma
<utkarshverma294@gmail.com> wrote:
>
> On Sat, Jul 17, 2021 at 09:23:19AM +0200, Lukas Bulwahn wrote:
> > Get a clone of the Linux kernel repository. The script checkpatch.pl
> > is under the scripts directory.
> >
> > Then, the first task is to run checkpatch.pl on a few files below and
> > share the results:
> >
> > drivers/acpi/acpica/acapps.h
> > drivers/usb/serial/iuu_phoenix.c
>

Utkarsh, the next task is to prepare some commits to the kernel
repository. You can find various hints on how to create your first
kernel patches on
https://www.kernel.org/doc/html/latest/process/submitting-patches.html.

Please first only send your first patches only to the
linux-kernel-mentees list, Dwaipayan and me, NOT to the official linux
kernel mailing lists that get_maintainers.pl suggests.

More instructions on which commits we would like to see first are below.

(snip)

>
>
> drivers/acpi/acpica/acapps.h:54: WARNING: macros should not use a trailing semicolon
> drivers/acpi/acpica/acapps.h:57: WARNING: macros should not use a trailing semicolon
> drivers/acpi/acpica/acapps.h:60: WARNING: macros should not use a trailing semicolon
> drivers/acpi/acpica/acapps.h:74: WARNING: macros should not use a trailing semicolon
>
> Macro defintions should never conclude with a semicolon. It is because
> when the macro is invoked and expanded the semicolon can unexpectedly
> change the control flow of the program. Also to be consistent with the
> ordinary function calls, macros defintion should not conclude with a
> semicolon.
>
> Explanation for this warning message is not in the Checkpatch
> documentation. But the message is self explanatory.
>

Please provide some checkpatch documentation on this rule. Please
include an example of what could go wrong if a trailing semicolon is
used.

> In the checkpatch.pl file, these lines check for the usage of define
> keyword
>
> scripts/checkpatch.pl:5878
>                 if ($perl_version_ok &&
>                     $realfile !~ m@/vmlinux.lds.h$@ &&
>                     $line =~ /^.\s*\#\s*define\s+$Ident(\()?/) {
>
> If it evaluates to true, then it further checks if the lines start with
> a define keyword and end with a semicolon.
>
> scripts/checkpatch.pl:5909
>                         } elsif ($dstat =~ /^\+\s*#\s*define\s+$Ident.*;\s*$/) {
>
> If this also evaluates to true, then a trailing semicolon is used by the
> macro, so it prints the appropriate warning message.
>
> scripts/checkpatch.pl:5914
>                                 WARN("TRAILING_SEMICOLON",
>                                      "macros should not use a trailing semicolon\n" . "$herectx");
>
> To fix the warning message, simply remove the semicolon present at the end
> of the macro defintion.
>

(snip)

>
> ================================
> drivers/usb/serial/iuu_phoenix.c
> ================================
>
>
>
> drivers/usb/serial/iuu_phoenix.c:256: WARNING: single byte memset is suspicious. Swapped 2nd/3rd argument?
> drivers/usb/serial/iuu_phoenix.c:1059: WARNING: single byte memset is suspicious. Swapped 2nd/3rd argument?
>
> memset is a function defined in include/linux/string.h file.
>
> void *memset(void *s, int c, size_t n);
>
> The memset() function fills the first n bytes of the memory area pointed
> to by s with the constant byte c. It returns a pointer to the memory area
> s.
> Calling the memset with n value of 1, is likely to be unintended and maybe
> by mistake (swapped with the int c value). It is more likely to fill a
> memory region with all ones, than to only fill a single byte in a
> memory region.
> So this message warns about the calling of memset with n value equal to 1
> and also hints about the swapping of c and n values.
>
> The checkpatch documentation explains about this warning.
>
> The checkpatch.pl first scans for the usage of memset, by searching for
> the "memset" keyword.
>
> scripts/checkpatch.pl:6738
>                 if ($perl_version_ok &&
>                     defined $stat &&
>                     $stat =~ /^\+(?:.*?)\bmemset\s*\(\s*$FuncArg\s*,\s*$FuncArg\s*\,\s*$FuncArg\s*\)/) {
>
> Then it extracts the arguments passed inside the memset function call.
>
> scripts/checkpatch.pl:6742
>                         my $ms_addr = $2;
>                         my $ms_val = $7;
>                         my $ms_size = $12;
>
> Then it finally checks the third argument, if it is either 0 or 1.
> If that happens to be true then it finally prints the warning message.
>
> scripts/checkpatch.pl:6749
>                         } elsif ($ms_size =~ /^(0x|)1$/i) {
>                                 WARN("MEMSET",
>                                      "single byte memset is suspicious. Swapped 2nd/3rd argument?\n" . "$here\n$stat\n");
>
> At both the places in drivers/usb/serial/iuu_phoenix.c file, when this
> warning appears, the module author intentionally called the memset with
> 3rd argument equal to 1. So this warning can be safely ignored.
>

But: is memset required if only one byte is to be set? Is there a more
standard way in C to express setting one byte?

If so, please create a patch that uses that more standard way of
setting one byte instead of memset.

(snip)

>
>
> drivers/usb/serial/iuu_phoenix.c:1191: WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
> drivers/usb/serial/iuu_phoenix.c:1194: WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
> drivers/usb/serial/iuu_phoenix.c:1197: WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
> drivers/usb/serial/iuu_phoenix.c:1201: WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
> drivers/usb/serial/iuu_phoenix.c:1205: WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
>
> The file permission macros used in the kernel code are defined in
> <linux/stat.h> like S_IRUGO and friends. But it is better to use their
> octal equivalent instead, because it easier for Linux users to
> understand 0444 instead of S_IRUGO.
>
> There is no checkpatch documentation for this warning message, but the
> message is self explanatory.
>

Please provide a patch for the checkpatch documentation here. Do you
find a reference to some coding style guide in the kernel or some
discussion on the mailing list that stated the preference you wrote
here?

Also create a patch for this file for this type of warning.

> The checkpatch.pl file checks for the usage of "S_<file_permissions>" like
> S_IRUGO and friends.
>
> scripts/checkpatch.pl:7348
>                 while ($line =~ m{\b($multi_mode_perms_string_search)\b}g) {
>
> if it finds one, then it prints the appropriate message,
>
> scripts.checkpatch.pl:7351
>                         if (WARN("SYMBOLIC_PERMS",
>                                  "Symbolic permissions '$oval' are not preferred. Consider using octal permissions '$octal'.\n" . $herecurr) &&
>
> To fix the warning message, simply use the octal equivalent instead of
> the macros, as mentioned in the warning message.
>
> diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
> index 19753611e..0be3b5e1e 100644
> --- a/drivers/usb/serial/iuu_phoenix.c
> +++ b/drivers/usb/serial/iuu_phoenix.c
> @@ -1188,20 +1188,20 @@ MODULE_AUTHOR("Alain Degreffe eczema@ecze.com");
>  MODULE_DESCRIPTION(DRIVER_DESC);
>  MODULE_LICENSE("GPL");
>
> -module_param(xmas, bool, S_IRUGO | S_IWUSR);
> +module_param(xmas, bool, 0644);
>  MODULE_PARM_DESC(xmas, "Xmas colors enabled or not");
>
> -module_param(boost, int, S_IRUGO | S_IWUSR);
> +module_param(boost, int, 0644);
>  MODULE_PARM_DESC(boost, "Card overclock boost (in percent 100-500)");
>
> -module_param(clockmode, int, S_IRUGO | S_IWUSR);
> +module_param(clockmode, int, 0644);
>  MODULE_PARM_DESC(clockmode, "Card clock mode (1=3.579 MHz, 2=3.680 MHz, "
>                 "3=6 Mhz)");
>
> -module_param(cdmode, int, S_IRUGO | S_IWUSR);
> +module_param(cdmode, int, 0644);
>  MODULE_PARM_DESC(cdmode, "Card detect mode (0=none, 1=CD, 2=!CD, 3=DSR, "
>                  "4=!DSR, 5=CTS, 6=!CTS, 7=RING, 8=!RING)");
>
> -module_param(vcc_default, int, S_IRUGO | S_IWUSR);
> +module_param(vcc_default, int, 0644);
>  MODULE_PARM_DESC(vcc_default, "Set default VCC (either 3 for 3.3V or 5 "
>                 "for 5V). Default to 5.");
>
>

(snip)

>
> drivers/usb/serial/iuu_phoenix.c:1199: WARNING: quoted string split across lines
> drivers/usb/serial/iuu_phoenix.c:1203: WARNING: quoted string split across lines
> drivers/usb/serial/iuu_phoenix.c:1207: WARNING: quoted string split across lines
>
> Quoted strings should not be splitted across multiple lines, this is done
> so that the strings that appear as messages in the userspace can be
> grepped.
>
> The checkpatch documentation has no information about this warning.
>

Please provide a patch for the checkpatch documentation here.

Also create a patch for this file for this type of warning.

> The checkpatch.pl checks for the usage of strings, if the previous line
> used a double quotes, and this line is also inside the quotes, then the
> string is split across multiple lines. But it makes exceptions when the
> previous string ends in a newline or '\t', '\r', ';', or '{' or is a octal
> or hexadecimal value.
>
> scripts/checkpatch.pl:6066
>                 if ($line =~ /^\+\s*$String/ &&
>                     $prevline =~ /"\s*$/ &&
>                     $prevrawline !~ /(?:\\(?:[ntr]|[0-7]{1,3}|x[0-9a-fA-F]{1,2})|;\s*|\{\s*)"\s*$/) {
>
> If the condition is true it prints the appropriate message,
>
> scripts/checkpatch.pl:6069
>                         if (WARN("SPLIT_STRING",
>                                  "quoted string split across lines\n" . $hereprev) &&
>
> To resolve the warning, make the whole string fit in a single line only.
>
> diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
> index 19753611e..f2c0dad91 100644
> --- a/drivers/usb/serial/iuu_phoenix.c
> +++ b/drivers/usb/serial/iuu_phoenix.c
> @@ -1195,13 +1195,10 @@ module_param(boost, int, S_IRUGO | S_IWUSR);
>  MODULE_PARM_DESC(boost, "Card overclock boost (in percent 100-500)");
>
>  module_param(clockmode, int, S_IRUGO | S_IWUSR);
> -MODULE_PARM_DESC(clockmode, "Card clock mode (1=3.579 MHz, 2=3.680 MHz, "
> -               "3=6 Mhz)");
> +MODULE_PARM_DESC(clockmode, "Card clock mode (1=3.579 MHz, 2=3.680 MHz, 3=6 Mhz)");
>
>  module_param(cdmode, int, S_IRUGO | S_IWUSR);
> -MODULE_PARM_DESC(cdmode, "Card detect mode (0=none, 1=CD, 2=!CD, 3=DSR, "
> -                "4=!DSR, 5=CTS, 6=!CTS, 7=RING, 8=!RING)");
> +MODULE_PARM_DESC(cdmode, "Card detect mode (0=none, 1=CD, 2=!CD, 3=DSR, 4=!DSR, 5=CTS, 6=!CTS, 7=RING, 8=!RING)");
>
>  module_param(vcc_default, int, S_IRUGO | S_IWUSR);
> -MODULE_PARM_DESC(vcc_default, "Set default VCC (either 3 for 3.3V or 5 "
> -               "for 5V). Default to 5.");
> +MODULE_PARM_DESC(vcc_default, "Set default VCC (either 3 for 3.3V or 5 for 5V). Default to 5.");
>

Overall, we expect you to provide a patch series that adds some more
checkpatch Documentation and some first changes to the file you
investigated. Remember each patch should do one thing.

We will review your patch, provide you feedback and once we are all
happy about the patches, we will let you know to send it to the
larger-audience kernel lists.

Good luck; we are looking forward to your patch series.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
