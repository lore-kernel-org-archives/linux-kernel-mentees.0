Return-Path: <SRS0=qsl3=IH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56FC0C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  9 Mar 2021 13:38:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63701650F5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  9 Mar 2021 13:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63701650F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=darmarit.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DED1E6F54A;
	Tue,  9 Mar 2021 13:38:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OsT1Yylom0EO; Tue,  9 Mar 2021 13:38:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 056526F532;
	Tue,  9 Mar 2021 13:38:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D59FAC000B;
	Tue,  9 Mar 2021 13:38:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E76BC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Mar 2021 13:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD9036F548
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Mar 2021 13:38:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nN9X7jPi5EDX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Mar 2021 13:38:20 +0000 (UTC)
X-Greylist: delayed 00:07:29 by SQLgrey-1.8.0
Received: from smtp1.goneo.de (smtp1.goneo.de [IPv6:2001:1640:5::8:30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 354E76F532
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Mar 2021 13:38:19 +0000 (UTC)
Received: from [192.168.1.127] (dyndsl-085-016-044-246.ewe-ip-backbone.de
 [85.16.44.246])
 by smtp1.goneo.de (Postfix) with ESMTPSA id 5F1452038178;
 Tue,  9 Mar 2021 14:30:48 +0100 (CET)
Subject: Re: [RFC] scripts: kernel-doc: avoid warnings due to initial
 commented lines in file
To: Aditya Srivastava <yashsri421@gmail.com>, corbet@lwn.net
References: <20210309125324.4456-1-yashsri421@gmail.com>
From: Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <8959bf29-9ee1-6a1d-da18-f440232864f3@darmarit.de>
Date: Tue, 9 Mar 2021 14:30:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210309125324.4456-1-yashsri421@gmail.com>
Content-Language: de-DE
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


Am 09.03.21 um 13:53 schrieb Aditya Srivastava:
> Starting commented lines in a file mostly contains comments describing
> license, copyright or general information about the file.
> 
> E.g., in sound/pci/ctxfi/ctresource.c, initial comment lines describe
> its copyright and other related file informations.

The opening comment mark /** is used for kernel-doc comments [1]

[1] 
https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#how-to-format-kernel-doc-comments

   -- Markus --

> 
> But as kernel-doc reads these lines, it results in ineffective warnings by
> kernel-doc, related to these.
> 
> Provide a simple fix by skipping first three lines in a file for checking
> kernel-doc comments.
> 
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>   scripts/kernel-doc | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index e1e562b2e2e7..431add05248e 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -2375,6 +2375,7 @@ sub process_file($) {
>       my $file;
>       my $initial_section_counter = $section_counter;
>       my ($orig_file) = @_;
> +    my $lineno = 0;	# to maintain the count of line number in a file
>   
>       $file = map_filename($orig_file);
>   
> @@ -2388,13 +2389,16 @@ sub process_file($) {
>   
>       $section_counter = 0;
>       while (<IN_FILE>) {
> +	$lineno++;
>   	while (s/\\\s*$//) {
>   	    $_ .= <IN_FILE>;
> +	    $lineno++;
>   	}
>   	# Replace tabs by spaces
>           while ($_ =~ s/\t+/' ' x (length($&) * 8 - length($`) % 8)/e) {};
>   	# Hand this line to the appropriate state handler
> -	if ($state == STATE_NORMAL) {
> +	if ($state == STATE_NORMAL
> +	    && $lineno > 3) {	# to avoid starting comment lines describing the file
>   	    process_normal();
>   	} elsif ($state == STATE_NAME) {
>   	    process_name($file, $_);
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
