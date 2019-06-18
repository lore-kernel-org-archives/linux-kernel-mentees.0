From: skhan@linuxfoundation.org (Shuah Khan)
Date: Tue, 18 Jun 2019 10:33:42 -0600
Subject: [Linux-kernel-mentees] [PATCH v4] Media: Radio: Change
 devm_k*alloc to k*alloc
In-Reply-To: <20190618081449.GA24889@kroah.com>
References: <f6821f6c-bd89-00bd-a3d9-721f3e3a11cd@eng.ucsd.edu>
	<20190618081449.GA24889@kroah.com>
Message-ID: <abc9771f-5262-92ba-5470-fe34b791e776@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190618163342.h-3KRNg0Amel7x7BOpBu-VMahK8viisLqW7bElOQa6A@z>

On 6/18/19 2:14 AM, Greg KH wrote:
> On Tue, Jun 18, 2019 at 12:47:02AM -0700, Luke Nowakowski-Krijger wrote:
>> Change devm_k*alloc to k*alloc to manually allocate memory.
>>
>> Memory is freed in v4l2.release callback which now calls
>> raremono_device_release to free up the appropriate memory,
>> just like in radio-shark driver.
> 
> Trailing whitespace :(
> 
> Please fix your editor.
> 
>>
>>
>> Reported-by: syzbot+a4387f5b6b799f6becbf at syzkaller.appspotmail.com
>> Signed-off-by: Luke Nowakowski-Krijger <lnowakow at eng.ucsd.edu>
>> ---
> 
> If this is a new version, properly version your patches, with a v2 and a
> description below the --- line as to what changed.  The documentation
> should say exactly how to do this.
> 
> Also, did you submit this to syzbot for testing?  You can do that
> through the email interface.
> 
> thanks,
> 
> greg k-h

Luke,

Once you fix all the issues, please include media mailing list and
everybody get_maintainers.pl suggests and Hans Verkuil as well.

thanks,
-- Shuah
