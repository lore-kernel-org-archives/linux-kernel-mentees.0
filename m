From: skhan at linuxfoundation.org (Shuah Khan)
Date: Tue, 30 Apr 2019 13:35:10 -0600
Subject: [Linux-kernel-mentees] [PATCH] Staging: rtl8192e: rtl8192e:
 Removed extra space before break statement
In-Reply-To: <20190430191558.GA22185@arch>
References: <20190430191558.GA22185@arch>
Message-ID: <ef2985e5-b696-2aa4-c3d8-4bc38c30c286@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Hi Puranjay,

On 4/30/19 1:15 PM, Puranjay Mohan wrote:
> Fixed a style issue reported by checkpatch.pl
> break statements had extra spaces before them.
> WARNING: Statements should start on a tabstop
> 

Please include the entire checkpatch warning line. Also commit log can 
have 75 char length lines and you don't have to limit them to a shorter 
length.

thanks,
-- Shuah
