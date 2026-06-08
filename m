Received: from relay2-p.mailbaby.net (relay2-p.mailbaby.net [68.168.211.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5612D37DEAA
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  8 Jun 2026 19:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.168.211.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780947153; cv=none; b=cf1gSXOhaZlLOcJrHSHzbEYcYyED6umziAwuHf6wniyiqQYBgrNKZY99lcH2TnVAwXty72soRBfHwZ6r+WB7vh8RDugbFtOEgi0EJdYmbay8Z+8G6ci9aVcNQjzCCbYoTAumSVqpwuTmaSyEWQP5aeo/lIg0km4WAFwblCbcFWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780947153; c=relaxed/simple;
	bh=ceqE3a670uVD8+/ti7Qpqi5HV5CdJtHWlWhIFfwvXTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7PGbpEOQAKcz8tF5sIN0gpNBniJKsANLE2CUEKyLAb2kikeayFh9kgPieKvxd5ngbTQTm2zkHDKie6KtMw3ktH93nMb2mOAZzv/i4x25FTcpMa1/J6wc/wg1SKYdQFkHKXuNEGrJPO21KM3R4X851e4hcpE20pAnDinqvRFg1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=agatha.dev; spf=pass smtp.mailfrom=agatha.dev; dkim=pass (1024-bit key) header.d=mailbaby.net header.i=@mailbaby.net header.b=TV+YDFjP; dkim=pass (2048-bit key) header.d=agatha.dev header.i=@agatha.dev header.b=HFz8mfTv; arc=none smtp.client-ip=68.168.211.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=agatha.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=agatha.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailbaby.net header.i=@mailbaby.net header.b="TV+YDFjP";
	dkim=pass (2048-bit key) header.d=agatha.dev header.i=@agatha.dev header.b="HFz8mfTv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbaby.net;
 q=dns/txt; s=bambino; bh=VySzLkRSM2EDNqQC/LnY1sgRIuSrEzwK+CJkYydMDV4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=TV+YDFjPrYYCV/5K9AJ8gCOi3zYXhrdLQ0NjJzwcQ1a2l24vLaBHs921RsIY+5TPBiVhOWHuv
 sc4kviCkSJITCXTTeUm8H08Vr0hC7PNzYzM45ltLSjkEaVBbWkkRpxAiszjJx6RTI5JJlRFREy2
 vo63er7sTPeC5K+HuA7J0LM=
Received: from mb-nj-kvm1.internal (mb-nj-kvm1.internal [10.10.2.10])
 (Authenticated sender: mb6724)
 by relay2-p.mailbaby.net (MailBabyMTA) with ESMTPSA id 19ea8b8d7a70007fa5.001
 for <linux-kernel-mentees@lists.linux.dev>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 08 Jun 2026 19:32:26 +0000
X-Zone-Loop: c48c83be8221abc590c9a43dcacbdca183144440a656
X-MB-ID: mb6724|me@agatha.dev
X-SPF: pass
Feedback-ID: mb6724:19ea8b:507c5a5c5e5d585f7d5a5951:mbaby
X-NS-SCAN: PASS
X-MAILBABY-ORIGIN: PASS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=agatha.dev;
	s=default; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VySzLkRSM2EDNqQC/LnY1sgRIuSrEzwK+CJkYydMDV4=; b=HFz8mfTvVpIdMxTW7zAUHIAdUZ
	GIwp7k+cB5MlLeqBf4mOUxWPp2DRBzXYNhXyc2OvfozSd5b8oZnXz+knaNU6g/fjlGOVCThAZFKSf
	qJklFgIVoTLCC1jbBzZ2nEm6xqK3ksvCPx3breYtT06qlrtMABBXkGz+Up6hATcfDFVK/XW+bGVyU
	pNnwfTLXlboaDNCeFOU5OMoKQ3v+vZJ5OtpgJ9aUGAJFK5SdY8iYg6K2OXsws/5yk7lsmG2DTiodD
	SHPACtu7kYcMEDEtzXFElVzjxbgNEUuE1/xW7R9sqpTdeVJqLjQplA6CVdCMRMPnyAxmTry29dNhv
	1YTDOyGw==;
Received: from [170.254.153.168] (port=39153 helo=guidai)
	by nyc3000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <code@agatha.dev>)
	id 1wWfhy-00000001NND-02Wq;
	Mon, 08 Jun 2026 15:32:26 -0400
Date: Mon, 8 Jun 2026 16:32:20 -0300
From: Agatha Isabelle Moreira <code@agatha.dev>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: joe@perches.com, kernelnewbies@kernelnewbies.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] get_maintainer: add recipients to output of script
Message-ID: <aicTcM1FhL8nT1mx@guidai>
References: <14198ef7adde6d0e24535edf64266201b7036fed.camel@perches.com>
 <20260608163411.70226-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608163411.70226-2-manuelebner@mailbox.org>
X-AuthUser: me@agatha.dev

On Mon, Jun 08, 2026 at 06:34:12PM +0200, Manuel Ebner wrote:
> Add all people tagged in all the mentioned commits to the output of this script.
> This is done to give credit to people who inspired the current commit or to get
> feedback from people who know the subject.

Some things to notice:
1) Cc someone in the message is not the way of giving credit, the tags
are already for that.

2) The way get_maintainer.pl works today already copies the relevant
people, you should state why your addition matters to that.

3) You are supposed to send the message again with `[PATCH v2]` in the
subject if you want your message to be tracked as a new version of the
patch. In that case you must include a changelog stating your changes.

See: https://docs.kernel.org/process/submitting-patches.html

4) I'm not sure why people in the mentioned patches should necessarily
be copied in a patch. I mean, if they are active contributors to that
part of the code they are likely already included in the regular
`get_maintainer.pl` output, they will either be listed in the
`MAINTAINERS` file or at least be fetched through git.

Keep in mind that `get_maintainer.pl` is not intended to be used to spam
people, but to get where to send your patches and who to copy. 

> index 16b80a700d4a..8c44b14391f9 100755
> --- a/scripts/get_maintainer.pl
> +++ b/scripts/get_maintainer.pl
> @@ -30,6 +30,7 @@ my $email_usename = 1;
>  my $email_maintainer = 1;
>  my $email_reviewer = 1;
>  my $email_fixes = 1;
> +my $email_mentioned = 0;
>  my $email_list = 1;
>  my $email_moderated_list = 1;
>  my $email_subscriber_list = 0;
> @@ -78,6 +79,7 @@ my $exit = 0;
>  
>  my @files = ();
>  my @fixes = ();			# If a patch description includes Fixes: lines
> +my @mentioned = ();		# If a patch description mentiones a patch
>  my @range = ();
>  my @keyword_tvi = ();
>  my @file_emails = ();
> @@ -264,6 +266,7 @@ if (!GetOptions(
>  		'n!' => \$email_usename,
>  		'l!' => \$email_list,
>  		'fixes!' => \$email_fixes,
> +		'mentioned!' => \$email_mentioned,
>  		'moderated!' => \$email_moderated_list,
>  		's!' => \$email_subscriber_list,
>  		'multiline!' => \$output_multiline,
> @@ -606,6 +609,8 @@ foreach my $file (@ARGV) {
>  		push(@files, $filename2);
>  	    } elsif (m/^Fixes:\s+([0-9a-fA-F]{6,40})/) {
>  		push(@fixes, $1) if ($email_fixes);
> +	    } elsif (m/\s+([0-9a-fA-F]{6,40})/) {
> +		push(@mentioned, $1) if ($email_mentioned);

If you still wanna submit this patch anyway, besides explaining the
reason to be accepted, I think you should check if your regex isn't
matching anything other than commit messages. For instance, I can easily
imagine this regex matching a regular hash that's not a commit id or a
memory address.

Imagine you have a kernel panic log in the commit message, for instance.
I think your script would likely misinterpret register values as commit
messages.

Really need to work on that. Though I would recommend that you discuss
with the list first and try to get people to understand why this might
be important first so you don't waste time fixing something that might
not get accepted. Unless you wanna use it for yourself locally.

-- 
Agatha Isabelle Moreira
C Developer | agatha.dev
Sourcehut: https://sr.ht/~devlavender/
