Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB30C6FD1C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Mar 2023 09:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0C65417F1;
	Fri, 24 Mar 2023 09:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0C65417F1
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0g0ELczH;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3VaINjeq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MPdEZVOTAjf6; Fri, 24 Mar 2023 09:53:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CC2B740286;
	Fri, 24 Mar 2023 09:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC2B740286
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A777FC0035;
	Fri, 24 Mar 2023 09:53:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9953C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 09:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81FA5615CD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 09:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81FA5615CD
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=0g0ELczH; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=3VaINjeq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3-zaTNU9Vjlp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 09:53:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B72A9615C6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B72A9615C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 09:53:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B150033777;
 Fri, 24 Mar 2023 09:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679651019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p5gU4YUVCJUKRvg7TRuNnivRS6YS1MoKDOqLZ95pv7A=;
 b=0g0ELczHnlGOC88a2Y0t/1ExMbIdXossK77nETDjPb/MkjhgzJQ6o4VzNwQ7dF1euKbZtK
 BN0gDA8dPClY/9SNSs/Qdz7y3wt9etasu1sOqKGmz/Dal5s95SuUs9r/8b39re775H8JS7
 4DLjgVePw+3Xhb/lIi3EIIFnFQNlHU4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679651019;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p5gU4YUVCJUKRvg7TRuNnivRS6YS1MoKDOqLZ95pv7A=;
 b=3VaINjeq+UXxdQE+bHl75dihBMVHJs8tR1sKJ/DbvBIjoACW89B18sbUD28ROJgKdeSa8Z
 uwfARJkK1f/qQYAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 80049138ED;
 Fri, 24 Mar 2023 09:43:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XJUgHstwHWRVKAAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 24 Mar 2023 09:43:39 +0000
Date: Fri, 24 Mar 2023 10:43:38 +0100
Message-ID: <87sfdu5vsl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alexander Heinrich <hallo@alexanderheinrich.de>
Subject: Re: [PATCH] kselftest/alsa: Fix -Wformat compiler warnings
In-Reply-To: <20230324092806.363253-1-hallo@alexanderheinrich.de>
References: <20230324092806.363253-1-hallo@alexanderheinrich.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Cc: shuah@kernel.org, tiwai@suse.com, perex@perex.cz, broonie@kernel.org,
 linux-kselftest@vger.kernel.org,
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

On Fri, 24 Mar 2023 10:28:06 +0100,
Alexander Heinrich wrote:
> 
> I noticed some -Wformat compiler warnings in pcm-test.c while building
> kselftest, fix them by using the same types for format specifier and arguments.
> 
> Signed-off-by: Alexander Heinrich <hallo@alexanderheinrich.de>

Those variables (rates, channels, etc) should be rather int instead of
long, as these are not 64bit parameters on 32bit archs.
On top of that, the whole '%l' prefix and cast should be dropped.

The only concern is the string to int conversion, and this should be
checked carefully, but other than that, it must be straightforward.

Care to work on that way?


thanks,

Takashi

> ---
>  tools/testing/selftests/alsa/pcm-test.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/alsa/pcm-test.c b/tools/testing/selftests/alsa/pcm-test.c
> index 58b525a4a32c..44fc5f826ab5 100644
> --- a/tools/testing/selftests/alsa/pcm-test.c
> +++ b/tools/testing/selftests/alsa/pcm-test.c
> @@ -371,7 +371,7 @@ static void test_pcm_time(struct pcm_data *data, enum test_class class,
>  		goto __close;
>  	}
>  	if (rrate != rate) {
> -		snprintf(msg, sizeof(msg), "rate mismatch %ld != %ld", rate, rrate);
> +		snprintf(msg, sizeof(msg), "rate mismatch %ld != %d", rate, rrate);
>  		goto __close;
>  	}
>  	rperiod_size = period_size;
> @@ -437,24 +437,24 @@ static void test_pcm_time(struct pcm_data *data, enum test_class class,
>  			frames = snd_pcm_writei(handle, samples, rate);
>  			if (frames < 0) {
>  				snprintf(msg, sizeof(msg),
> -					 "Write failed: expected %d, wrote %li", rate, frames);
> +					 "Write failed: expected %ld, wrote %li", rate, frames);
>  				goto __close;
>  			}
>  			if (frames < rate) {
>  				snprintf(msg, sizeof(msg),
> -					 "expected %d, wrote %li", rate, frames);
> +					 "expected %ld, wrote %li", rate, frames);
>  				goto __close;
>  			}
>  		} else {
>  			frames = snd_pcm_readi(handle, samples, rate);
>  			if (frames < 0) {
>  				snprintf(msg, sizeof(msg),
> -					 "expected %d, wrote %li", rate, frames);
> +					 "expected %ld, wrote %li", rate, frames);
>  				goto __close;
>  			}
>  			if (frames < rate) {
>  				snprintf(msg, sizeof(msg),
> -					 "expected %d, wrote %li", rate, frames);
> +					 "expected %ld, wrote %li", rate, frames);
>  				goto __close;
>  			}
>  		}
> -- 
> 2.34.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
